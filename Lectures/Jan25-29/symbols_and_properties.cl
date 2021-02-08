#! /usr/bin/gcl -f

; Symbols are what we would generally refer to in other languages as
; identifiers

; In Lisp we can have the code treat symbols themselves as data, have the code look at the 
; name of variable x, not just access the data of x, or pass the name of x to a function

; Programs can check to see if a symbol has been bound to a value or not, and can associate
; a list of extra properties with symbols, looking up these properties as desired.


; when we declare a function or a variable we implicity bind the symbol to that function/variable
; e.g (defvar x 3) is binding symbol 'x to value 3

; we can check if a symbol is currently bound to a value or a function using boundp and fboundp

(symbolp 'x)    ; returns t iff x is a symbol
(boundp 'x)     ; returns t iff x is symbol bound to a value
(fboundp 'x)    ; returns t iff x is symbol bound to a func

(defvar x 3)

(defun f (a)
  (if (symbolp a)
    (format t "You passed me a symbol ~%")
    (format t "You did not pass me a symbol ~%")))


(defvar y 'x)

(format t "Is x a symbol?  ~A~%" (symbolp 'x))
(format t "Is q a symbol? ~A~%" (symbolp 'q))
(format t "Is t a symbol ~A~%" (symbolp 't))
(format t "Is f a symbol ~A~%" (symbolp 'f))
(format t "Is + a symbol ~A~%" (symbolp '+))
(format t "Does y contain a symbol? ~A~%" (symbolp y))
(format t "Passing 'x to f gave: ~A~%~%" (f 'x))
(format t "Passing y to f gave: ~A~%~%" (f y))

(format t "Is x bound to a value? ~A ~%~%" (boundp 'x))
(format t "Is f bound to a value ~A ~%~%" (boundp 'f))

(format t "Is x bound to a function? ~A ~%~%" (fboundp 'x))
(format t "Is f bound to a function? ~A ~%~%" (fboundp 'f))
(format t "Is + bound  to a function? ~A ~%~%" (fboundp '+))


; Comparing symbols, you must convert them to strings first

(defvar s1 'x)
(defvar s2 'y)

(if (string= (symbol-name s1) (symbol-name s2))
  (format t "~A and ~A are equal ~%~%" s1 s2)
  (format t "~A and ~A are not equal ~%~%" s1 s2))

; symbol propertys

; we can establish a list of property names and values to associate with a symbol.
; rather like a hash table for the symbol (though actually has a lot more runtime overhead)

; look up value of property p for symbol s
; (get s p)

(format t "Print symbol list for x ~A ~%~%" (symbol-plist 'x))

; Unbinding symbols
(format t "Unbinding var 'x ~A ~%" (makunbound 'x))
(format t "Unbinding function f  ~A ~%" (fmakunbound 'f))

(format t "Is x bound to a value? ~A ~%" (boundp 'x))
(format t "Is f bound to a function? ~A ~%" (fboundp 'f))
