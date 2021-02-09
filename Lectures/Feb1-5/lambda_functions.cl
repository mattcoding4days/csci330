#! /usr/bin/gcl -f

; anonymous functions

(format t "Define a lambda, store it in f: ~A ~%" 
        (defvar f (lambda (x)
                    (if (numberp x)
                      (- x)))))


(format t "Use apply to negate 10: ~A ~%" (apply f '(10)))
(format t "Use funcall to negate -3: ~A ~%" (funcall f -3))
(format t "Use mapcar to negate (10 -3 6): ~A ~%" (mapcar f '(10 -3 6)))
