#! /usr/bin/gcl -f

; apply:
; (apply 'someFunction ListOfArgs)
(format t "Summation of 1 2 3 with apply: ~A ~%~%" (apply '+ '(1 2 3)))

; (maphash 'someFunction 'HashTable)

; sort:
(format t "Sort in increasing: ~A ~%" (sort '(10 5 5 22) '<))
(format t "Sort in decreasing: ~A ~%" (sort '(10 5 5 22) '>))

; funcall: similar to apply, instead of providing the arguments in a list,
; we just provide them directly in the function call
; (funcall f x y z) ; acts like (f x y z)

(format t "~%Summation of 1 2 3 with funcall: ~A ~%" (funcall '+ 1 2 3))

; eval: we give the entire express as a list rather than seperating them
(format t "Summation of 1 2 3 with eval: ~A ~%" (eval '(+ 1 2 3)))

; Eval continued, a snippet
(format t "~%Building (list 'sqrt 'a): ~A ~%" (defvar e (list 'sqrt 'a))); builds '(sqrt a)
; now we define a
(defvar a 16)
(format t "Eval called on e of a: ~A ~%" (eval e)) ; this will call e on a , which should return 4

(setf a 49)
(format t "(setf a 49): ~A ~%" (eval e)) ; return 49

; map
(format t "~%Use map to cons the head of a list onto another: ~A ~%" (map 'list 'cons '(1 2 3) '((10 11) (20 21) (30 31))))


; maplist: executes a function on the head of a list, then the next element so on and so forth
(format t "~%Maplist applying length to '(10 20 30): ~A ~%" (maplist 'length '(10 20 30)))

; mapcar: runs the function once on each element and builds a list of the results
(format t "~%(mapcar 'sqrt '(16 4 169): ~A~%" (mapcar 'sqrt '(16 4 169)))

; reduce: '+ '(10 5 17 20))
; first runs: (+ 10 5) and replaces them with the answer (15 17 20)
; second run: (+ 15 17) and replaces them with the answer (32 20)
; third run: (+27 20) and replaces them with the answer (52)
(format t "~%(reduce '+ '(10 5 17 20)):  ~A~%" (reduce '+ '(10 5 17 20)))


; Next steps: Now that we can use higher order functions, we'll start developing lisp code that writes
; lisp code.

; We can have our scripts generate and (through higher order functions) run new lisp functions or expressions

; We can create functions which analyze and rewrite existing lisp code, the run the revised version

; We can combine this with let blocks to create class/object like behavior in lisp
