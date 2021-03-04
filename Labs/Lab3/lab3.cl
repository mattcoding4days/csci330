; let-over-labels exercise
; ------------------------
; the goal is to write a function, buildTimeTracker, that creates and returns a dispatcher
;     (following our let-over-labels-over-lambda approach) that keeps track of elapsed time
;     for a home planet and a fleet of spacecraft travelling from that planet.
; for each spacecraft, it tracks the speed relative to the home planet (in km/s)
;     and the time that has elapsed since launch for that spacecraft,
;     accounting for time dilation (the time that has passed on the home planet will
;     be greater than the time passed for each spacecraft)
; the commands supported be the dispatcher, and the formula for calculating the passage
;     of time based on speed, are provided below.
;
; buildTimeTracker expects to be given a single list as its parameter, e.g.
;       (buildTimeTracker ("fred" ("bob" 10) ("joe" 23)))
;     assumes first name in list must be a string, giving a name for the home planet
;     the rest of the list are in pairs, each pair consisting of
;        (1) a string specifying the name of a spacecraft
;        (2) a non-negative integer specifying its speed relative to the home planet (in km/s)
;
;     the returned dispatcher handles commands as follows:
;
;        set a new speed for a spacecraft,
;            dispatch command is 'Speed, arguments are the name of the spacecraft and new speed
;                e.g. (funcall Dispatcher 'Speed "Bob" 2500)
;            returns their updated speed
;                (if spacecraft or new speed is invalid it doesn't change anything, returns nil)
;
;        query what the current time is (seconds since launch) for a spacecraft or home planet
;            dispatch command is 'CurrentTime, argument is the spacecraft/planet name
;                e.g. (funcall Dispatcher 'CurrentTime "Bob")
;            returns current time for that user (seconds since launches)
;                 (if the user isn't in the list then it returns nil)
;
;        specify a new (additional) amount of time that has passed on earth
;            dispatch command is 'TimePassed, argument is the amount of time that has passed
;                e.g. (funcall Dispatcher 'TimePassed 100)
;            calculates and updates each spacecraft's current time
;                based on their speed relative to the home planet
;            returns the updated time on the home planet (seconds since launches)
;                (if the new time is invalid then it doesn't change the times, returns nil)
;
;            the time computation for spacecraft is as follows:
;                if N seconds pass on the home planet while the craft is travelling at speed S
;                   then the time that passes for them is N * sqrt(1 - (S*S/C*C))
;                   where C = 299792 (approximate speed of light in km/s)
;                assuming (a) that the speed is expressed relative to the home planet,
;                     and (b) that I haven't messed up the formula :)
;
; example:
;  setting up a dispatcher for a home planet named Max and three spacecraft
;     (defvar TT '(buildTimeTracker ("Max" ("Ivan" 12300) ("Zalika" 61000) ("Emma" 37200))))
;  calls utilizing the dispatcher
;     (defvar r (funcall TT 'TimePassed 1000)            ; 1000 seconds have passed on earth
;     (setf   r (funcall TT 'CurrentTime "Emma"))        ; lookup Emma's current time
;     (setf   r (funcall TT 'Speed "Zalika" 12345))      ; set Zalika's new speed to 12345 km/s



(defun buildTimeTracker (L)
  (let
    ; local vars
    ( 
      (fleet_map (make-hash-table :test 'equal))
      (homePlanetName "") 
      (timeSinceLaunch 0)
      (*lightspeed_kms* 299792))
    
    ;; Check if the main argument L is a valid list
    (if (or (null L) (not (listp L)))
      (block
        MainArgNotList
        (format t "Invalid argument list: ~A~%" L)
        (return-from buildTimeTracker 'Error)))
    
    ;; Check if home planet name is valid
    (if (stringp (car L))
      (setf homePlanetName (car L))
      (block
        InvalidHPName
        (format t "Invalid Home Planet Name: ~A~%" (car L))
        (return-from buildTimeTracker 'Error)))


    ; local methods
    (labels
      (
       (exitOnErrorMain
         (errorMsg obj)
         (format t "~A'~A'~%" errorMsg obj)
         (return-from buildTimeTracker 'Error))

       (initialize
         ( )
         ; iterate throught the lists of ships and error check
         (dolist (ship (cdr L))
           ; check if the name of the ship is a string, and not empty
           (if (not (stringp (car ship)))
               (exitOnErrorMain "initialize: ship name not a string -> " (car ship) buildTimeTracker))

           ; check if ship name is empty
           (if (not (> (length (car ship)) 0))
               (exitOnErrorMain "initialize: empty ship name -> " (car ship)))

           ; check if ship speed is indeed a number
           (if (not (integerp (cadr ship)))
               (exitOnErrorMain "initialize: ship speed is not a number -> " (cadr ship)))

           ; check if speed is greater than 0
           (if (not (> (cadr ship) 0))
               (exitOnErrorMain "initialize: ship speed must be greater than 0 -> " (cadr ship)))
        
           ; all fields are valid, build a hash map with fields
           (setf (gethash (car ship) fleet_map) (list (cadr ship) 0))))


       ; debug printer method
       (printAll
         ( )
           (format t "~%*** Debug Mode ***~%==================~%~%Printing Hash Table~%~%")

           (loop for key being the hash-keys of fleet_map
                 using (hash-value value)
                 do (format t "Name: ~A ~%Speed: ~A~%Time: ~A~%~%" key (car value) (cadr value))))


       ; set a new speed for a spacecraft,
       ; dispatch command is 'Speed, arguments are
       ; the name of the spacecraft and new speed
       ; e.g. (funcall Dispatcher 'Speed "Bob" 2500)
       ; returns their updated speed
       ; (if spacecraft or new speed is invalid it doesn't change anything, returns nil)
       (updateSpeed
         (spacecraftName newSpeed)

         (format t "~%*** Setting new speed of '~A' for space ship '~A' ***~%" newSpeed spacecraftName)

         (if (not (stringp spacecraftName) )
           (block
             HandleError
               (format t "updateSpeed: space Ship name needs to be a string -> ~A~%" spacecraftName )
               (return-from updateSpeed nil)))
         
         (if (not (> (length spacecraftName) 0))
             (block
               HandleError
             (format t "updateSpeed: space Ship name cannot be empty -> ~A~%" spacecraftName )
             (return-from updateSpeed nil)))

         (if (not (integerp newSpeed))
             (block
               HandleError
             (format t "updateSpeed: new speed must an integer -> ~A~%" newSpeed )
             (return-from updateSpeed nil)))

         (if (not (> newSpeed 0) )
             (block
               HandleError
             (format t "updateSpeed: new speed must be greater than 0 -> ~A~%" newSpeed )
             (return-from updateSpeed nil)))

         (loop for key being the hash-keys of fleet_map
               using (hash-value value)
               do (if (equal key spacecraftName)
                    (block
                      Update
                      (setf (car value) newSpeed)
                      (return-from updateSpeed (car value))
                      (return-from updateSpeed nil)))))


       ; query what the current time is (seconds since launch) for a spacecraft or home planet
       ; dispatch command is 'CurrentTime, argument is the spacecraft/planet name
       ; e.g. (funcall Dispatcher 'CurrentTime "Bob")
       ; returns current time for that user (seconds since launches)
       ; (if the user isn't in the list then it returns nil)
       (lookUpTime
         (name)
         (format t "~%*** Looking up current time for: '~A' ***~%" name)

         (if (not (stringp name))
           (block
           InvalidName
           (format t "lookUpTime: Invalid name passed ~A~%" name)
           (return-from lookUpTime 'Error)))

         (if (equal name homePlanetName)
           (return-from lookUpTime timeSinceLaunch))

         (loop for key being the hash-keys of fleet_map
               using (hash-value value)
               do (if (equal key name)
                    (block
                      Update
                      (return-from lookUpTime (cadr value))
                      (return-from lookUpTime nil)))))

       ; private helper method for updateTime
       ; the time computation for spacecraft is as follows:
       ; if N seconds pass on the home planet while the craft is travelling at speed S
       ; then the time that passes for them is N * sqrt(1 - (S*S/C*C))
       ; where C = 299792 (approximate speed of light in km/s)
       (calcTime
         (newTime relspeed)
         (format t "~%*** Calculating new time for time '~A' and speed '~A' ***~%~%" newTime relspeed)

         (setf final (* newTime (sqrt (- 1 (/ (* relspeed relspeed)
                                              (* *lightspeed_kms* *lightspeed_kms*))))))
         (return-from calcTime final))


        ; specify a new (additional) amount of time that has passed on earth
        ; dispatch command is 'TimePassed, argument is the amount of time that has passed
        ; e.g. (funcall Dispatcher 'TimePassed 100)
        ; calculates and updates each spacecraft's current time
        ; based on their speed relative to the home planet
        ; returns the updated time on the home planet (seconds since launches)
        ; (if the new time is invalid then it doesn't change the times, returns nil)
       (updateTime
         (addedTime)

         (if (not (integerp addedTime))
           (return-from updateTime nil))

         (if (not (> addedTime 0))
           (return-from updateTime nil))

         (format t "~%*** Updating time for home planet ***~%")
         (setf timeSinceLaunch (+ timeSinceLaunch addedTime))

         (loop for key being the hash-keys of fleet_map
               using (hash-value value)
               do (setf (second value) (calcTime (+ (second value) addedTime) (first value))))

         (return-from updateTime timeSinceLaunch))

       ) ; end of labels list

      ; call initialize on 'object instantiation'
      (initialize)

      ; building and returning dispatcher
      (lambda (cmd arg1 &optional (arg2 nil))
        (cond
          ; debug print method
          ((equalp cmd 'debug) (printAll))

          ; 'Speed
          ((equalp cmd 'Speed) (updateSpeed arg1 arg2))

          ; 'CurrentTime
          ((equalp cmd 'CurrentTime) (lookUpTime arg1))

          ; 'TimePassed
          ((equalp cmd 'TimePassed) (updateTime arg1))
          ) ; end of cond
        ) ; end of lambda
      ) ; end of labels
    ) ; end of let
  ) ; end of defun



; macro exercise
; --------------
; create a set of macros that lets the programmer use the following
;
;   (setTime TT n) to set a new time on the home planet,
;        assuming TT is a dispatcher returned by a call to buildTimeTracker,
;        e.g. (defvar X (buildTimeTracker ...regular args....))
;             (setTime X 10000)      ; becomes (funcall X 'TimePassed 10000)
;
;   (getTime TT u) to query the current time for the specified spacecraft,
;        e.g. (getTime X "bob")      ; becomes (funcall X 'CurrentTime "bob")
;
;   (setSpeed TT s) to set a new speed for the specified spacecraft,
;        e.g. (setSpeed X "Max" 500) ; becomes (funcall X 'Speed "Max" 500)



(defmacro setTime (Dispatcher NewTime)
  `(funcall ,Dispatcher 'TimePassed ,NewTime))

(defmacro getTime (Dispatcher Spacecraft)
  `(funcall ,Dispatcher 'CurrentTime ,Spacecraft))

(defmacro setSpeed (Dispatcher Spacecraft NewSpeed)
  `(funcall ,Dispatcher 'Speed ,Spacecraft ,NewSpeed))
