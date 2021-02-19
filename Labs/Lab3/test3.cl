#! /usr/bin/gcl -f

(format t "~%Loading lab3.cl~%")
(load "lab3.cl")


; sample test calls: basic use of dispatcher
; ------------------------------------------



(format t "~%Creating dispatcher~%~%")
(defvar TT (buildTimeTracker '("Max" ("Ivan" 12300) ("Zalika" 61000) ("Emma" 37200))))
;(defvar TT (buildTimeTracker '("Max" ("Ivan" -1) ("Zalika" 61000) ("Emma" 37200))))
;(defvar TT (buildTimeTracker '("Max" ("Ivan" 6100) )))


;;;; Test debug statement
(if (not (eq TT 'Error))
  (funcall TT 'debug "")
  (format t "~A~%" TT))


;;;; Test Speed with correct params
;(if (not (eq TT 'Error))
  ;(format t "Result of 'Speed: ~A~%" (funcall TT 'Speed "Ivan" 9000))
  ;(format t "~A~%" TT))


;;;; Test Speed with negative speed
;(if (not (eq TT 'Error))
  ;(format t "Result of 'Speed: ~A~%" (funcall TT 'Speed "Ivan" -1))
  ;(format t "~A~%" TT))


(format t "~%Setting time passed to 1000~%")
(defvar r (funcall TT 'TimePassed 1000))
(format t "    result is ~A~%" r)

;(format t "~%Looking up time for Ivan~%")
;(setf   r (funcall TT 'CurrentTime "Ivan"))
;(format t "    result is ~A~%" r)

;(format t "~%Changing Zalika speed to 12345~%")
;(setf   r (funcall TT 'Speed "Zalika" 12345))
;(format t "    result is ~A~%" r)



;;;; One more debug statement to see changes
(if (not (eq TT 'Error))
  (funcall TT 'debug "")
  (format t "~A~%" TT))


;; sample test calls: use of macros
;; --------------------------------

;(format t "~%Using macro to set time passed to 22222~%")
;(setf r (setTime TT 22222))
;(format t "    result is ~A~%" r)

;(format t "~%Using macro to look up current time for Emma~%")
;(setf r (getTime TT "Emma"))
;(format t "    result is ~A~%" r)

;(format t "~%Using macro to change Zalika speed to 500~%")
;(setf r (setSpeed TT "Zalika" 500))
;(format t "    result is ~A~%" r)

;(format t "~%...end of testing~%~%")
