#! /usr/bin/gcl -f


; Functions can be created with defun, lambda or labels
; Three different formats, based on how the function was created
; Each format starts with a special symbol identifying the format.

;;;; we can pull apart functions if we know how they were constructed

(defun g (x y)
  (* x y))

(format t "defun format: ~A ~%~%" (function g))
(format t "nth 0: ~A ~%" (nth 0 (function g)))
(format t "nth 1: ~A ~%" (nth 1 (function g)))
(format t "nth 2: ~A ~%" (nth 2 (function g)))
(format t "nth 3: ~A ~%" (nth 3 (function g)))


(format t "~%~%Lambda format~%")
(format t "~A ~%" (function (lambda (x y) (* x y))))
(format t "The 3 empty lists are environment variables ~%")

; there is a trick fro safe printing of cyclic lists:

; make a global variable and assign it true
;(let ((*print-circle* t))
      ;(format t "~A ~%" myCyclicList))


; label format

;(labels ((h (x y) (* x y)))
  ;((format t "~A~%" (function h))))

; passing the form of a function.

;; if we've got the list representing a function, the symbol at the front
;; tells us which format it is, and thus if we should expect to find 3 environment
;; lists and/or a function name before the parameter list
