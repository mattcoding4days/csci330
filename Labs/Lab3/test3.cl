#! /usr/bin/gcl -f

(format t "~%Loading lab3.cl~%")
(load "lab3.cl")


; sample test calls: basic use of dispatcher
; ------------------------------------------



(format t "~%Creating dispatcher~%~%")
(defvar TT (buildTimeTracker '("Bajor" ("The Enterprise" 32700) ("The Defiant" 67890) ("Klingon Warbird" 45678))))


;;;; Test debug statement
(if (not (eq TT 'Error))
  (funcall TT 'debug "")
  (format t "~A~%" TT))


(defvar r (funcall TT 'TimePassed 1000))                      ; 1000 seconds have passed on earth
(format t "Result of TimePassed: ~A~%~%" r)                   ; print result
(setf   r (funcall TT 'CurrentTime "The Enterprise"))         ; lookup Emma's current time
(format t "Result of CurrentTime: ~A~%~%" r)
(setf   r (funcall TT 'Speed "The Enterprise" 12345))         ; set The Enterprise's new speed to 12345 km/s
(format t "Result of Speed: ~A~%~%" r)


;;;; Test Speed with correct params
;(if (not (eq TT 'Error))
  ;(format t "Result of 'Speed: ~A~%" (funcall TT 'Speed "The Enterprise" 9000))
  ;(format t "~A~%" TT))


;;;; Test Speed with negative speed
;(if (not (eq TT 'Error))
  ;(format t "Result of 'Speed: ~A~%" (funcall TT 'Speed "The Enterprise" -1))
  ;(format t "~A~%" TT))


;(format t "~%Setting time passed to 1000~%")
;(defvar r (funcall TT 'TimePassed 1000))
;(format t "~%Result is ~A~%" r)

;(format t "~%Looking up time for The Enterprise~%")
;(setf   r (funcall TT 'CurrentTime "The Enterprise"))
;(format t "~%Result is ~A~%~%" r)

;(format t "~%Looking up time for Home Planet~%")
;(setf   r (funcall TT 'CurrentTime "Bajor"))
;(format t "~%Result is ~A~%~%" r)

;(format t "~%Changing The Defiant speed to 12345~%")
;(setf   r (funcall TT 'Speed "The Defiant" 12345))
;(format t "~%Result is ~A~%~%" r)



;; sample test calls: use of macros
;; --------------------------------

(format t "~%Using macro to set time passed to 22222~%")
(setf r (setTime TT 22222))
(format t "    result is ~A~%" r)

(format t "~%Using macro to look up current time for Emma~%")
(setf r (getTime TT "The Enterprise"))
(format t "    result is ~A~%" r)

(format t "~%Using macro to change The Enterprise speed to 500~%")
(setf r (setSpeed TT "The Enterprise" 500))
(format t "    result is ~A~%" r)

;;;; One more debug statement to see changes
(if (not (eq TT 'Error))
  (funcall TT 'debug "")
  (format t "~A~%" TT))

(format t "~%...end of testing~%~%")
