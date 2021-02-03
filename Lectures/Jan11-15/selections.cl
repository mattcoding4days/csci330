#! /usr/bin/gcl -f

; if else cond etc

; Explanation: Setq is used only for setting the values of symbols but setf 
; can be used for anything. Setf can be used for setting value of any 
; data-type and not only symbols.

(setq var 3.23)

(if (integerp var)
  (format t "True Statement ~%"
    (setf var 4))
  (format t "False Statement ~%"
    (setf var -1)))

(format t "~d ~%" var)

; cond statement
(setq a 10)

(cond 
  ( (> a 20)
   (format t "~%~d is greater than 20 ~%" a))
  ( (= a 12)
   (format t "~%~d is equal to 12 ~%" a))
  ; this is our catch all else
  (t (format t "~%The value of a is ~d ~%" a)))

;; When
(setq b 100)

; does something if a value is true
(when (> b 20)
  (format t "~%b is greater than 20 ~%")
  (setf b 120))

(format t "b has been reset to: ~A ~%" b)

; Unless is the opposite, does something when a value is false
(setq x -3)

(unless (> x 0)
  (format t "Taking absolute value of ~d ~%" x)
  (setf x (abs x)))

(format t "New value of x is: ~d ~%" x)

;; Case Statements

(case x
  (> 0 (format t "x is positive ~%"))
  (otherwise (format t "x is negative ~%")))

;; Test the type
(typecase x 
  (string (format t "x is a string ~%"))
  (boolean (format t "x is an integer ~%"))
  (integer (format t "x is a float ~%"))
  (otherwise (format t "x is an unkown type ~%")))
