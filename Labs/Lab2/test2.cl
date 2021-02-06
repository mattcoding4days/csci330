#! /usr/bin/gcl -f

(load "lab2.cl")

(defvar V 6)
(format t "~%Try (f ~A) ~%" V)
(format t "Result: ~A ~%" (f V))

(setf V '(1.5 0 2.1 3 "foo" 4))
(format t "~%Try (gt '(~A)) ~%" V)
(format t "Result: ~A ~%" (apply 'gt V))

(set f V '(nil 3 (nil 5 nil)))
(format t "~%Try (isTree ~A) ~%" V)
(format t "Result: ~A ~%" (isTree V))

(format t "~%Try (sumTree ~A) ~%" V)
(format t "Result: ~A ~%~%" (sumTree V))
