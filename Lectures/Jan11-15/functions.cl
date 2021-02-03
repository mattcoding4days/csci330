#! /usr/bin/gcl -f

; NOTES:  defvar essentially creates a global variable, they are not local to
;         the function

;         If you use setf on an undeclared variable it acts like a defvar

;         If you use setf on a parameter then it changes the local value
;         of the parameter (generally ok, as long as thats what you meant to do)

(si::use-fast-links nil)
(setq *print-case* :capitalize) ; :upcase or :downcase can easily go in here

; defun take 3 or more params

; 1. name of the function
; 2. the second is the parameter list
; 3. the remaining params are treated as a sequence of
;    function calls to make (the body of the function)

; functions can take parameter strings

(defun foo (x)
  "@Docstring: Foo just prints out the value of x"
  (format t "The value of param x is ~a ~%" x))

(foo "Hello World!")

; to look at the documentation string use doc function
(format t "~%~A ~%" (documentation 'foo 'function))

; This is not pure FP, but if a function body consists of multiple
; statements it will execute each in sequence, then function returns
; the value of the last statement run


; type checking params
(defun intpow (x y)
  "Returns x^y if both are integers, otherwise nil"
  (cond
    ( (not (integerp x)) nil)
    ( (not (integerp y)) nil )
    (t (expt x y))))

(format t "~%~A ~%" (intpow 3 4))
(format t "~%~A ~%" (intpow 2.3 4))


; global vars with setf

(defun f (x)
  (setf i 10)
  (if (numberp x)
    (* i x)
    (format t "Oops, ~A is not a number ~%" x)))

(format t "f(6) is ~A~%" (f 6))
(format t "i is ~A~%" i)


; local variables using let blocks

(defun foo (a)
  "foo does stuff"
  (let
    ((b 2)
     (c 3))
    (* b a c)))

(format t "~A~%" (foo 8))
