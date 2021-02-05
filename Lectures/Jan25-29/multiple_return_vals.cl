#! /usr/bin/gcl -f


(format t "Returning multiple values with 'values' ~%~%")

(defun f (x)
  ; if x is numeric return sqrt x, -x, and x^2
  (if (numberp x)
    (values (sqrt x) (- x) (* x x))))

(defvar 1st (f 3))
(defvar 2nd (nth-value 1 (f 3)))
(defvar 3rd (nth-value 2 (f 3)))

(format t "first: ~A~%Second: ~A~%Third: ~A ~%~%" 1st 2nd 3rd)

(terpri)

(format t "Using multiple value bind ~%~%")

(multiple-value-bind
  (first second third) (f 3)
  (format t "sqrt is: ~A ~%" first) 
  (format t "negative is: ~A ~%" second) 
  (format t "sqaure is: ~A ~%" third))
