#! /usr/bin/gcl -f

(load "lab2.cl")

;(defvar V 8)
;(format t "~%Try (f ~A) ~%" V)
;(format t "Result: ~A ~%" (f V))


;(setf V '(1.5 0 2.1 "foo" 3 4))
;(format t "~%Try (gt '(~A)) ~%" V)
;(format t "Result: ~A ~%" (gt 2 V))


;(setf V '(1.5 0 2.1 3 "foo" 4))
;(format t "~%Try (gt '(~A)) ~%" V)
;(format t "Result: ~A ~%" (apply 'gt V))

;(format t "~A ~%" (gt 2 V))


;(setf V '(17 10 93))
;(setf V '(nil 3 (nil 5 nil)))
;(setf V '((nil -14 nil) 97 nil))
;(setf V '(nil 3 (nil 5 nil)))

(setf V '(nil 7 (nil 8 nil)))
(format t "~%Try (isTree ~A) ~%" V)
(format t "Result: ~A ~%" (isTree V))

;(setf V '((nil 10 nil) 240 (nil -8 nil)))
;(format t "~%Try (sumTree ~A) ~%" V)
;(format t "Result: ~A ~%~%" (sumTree V))
