#! /usr/bin/gcl -f

; let-over-lambda referes to having a let block whose return
; value is a lambda function

; Even outside the let block, the returned lambda function can
; access/update the blocks variables, even across multiple calss
; to the lambda.

; The blocks variables persist in memory as long as the lambda function is
; still accessible somewhere

; Effectively creates a set of hidden variables shared across calls to the lambda function
; acting much like fields of a class plus an access method.

; let block variables store the radius of a circle, default value 1,
; and the lambda function can update it or print it (default action)


(defvar f
  (let ((r 1))
    (lambda (cmd &optional (arg 1))
      (cond
        ((equal cmd 'set) (setf r arg))
        (t (format t "r is ~A ~%" r))))))

(funcall f 'set 5)
(funcall f 'print)


; use closures in an OOP sense, like creating a constructor, then executing that variable
; as a dispatch function

(defun buildCircle (&optional (xInit 0) (yInit 0) (rInit 1))
  (let ; start with valid defaults
    ((x 0) (y 0) (r 1))
    ; update from parameters if they are valid
    (if (realp xInit) (setf x xInit))
    (if (realp yInit) (setf y yInit))
    (if (and (realp rInit) (> rInit 0)) (setf r rInit))

    ; lambda function expects a command and possibly an arg
    (lambda (cmd &optional (arg nil))
      (cond
        ; check for/process print commands
        ((equalp cmd 'print) (format t "(~A, ~A): ~A ~%" x y r))

        ; check for/process area commands return pi r^2
        ((equalp cmd 'area) (* 3.14 r r))

        ; check for/process set-radius commands
        ((equalp cmd 'radius)
         (if (and (realp arg) (> arg 0))
           (setf r arg)
           (format t "Error: Invalid radius ~A ~%" arg)))

        ; check for/process set-coords commands
        ((equalp cmd 'coords)
          ; need to make sure arg is a list of two reals
          (if (and (listp arg) (= (length arg) 2)
                   (realp (car arg)) (realp (cadr arg)))
            ; arg looks ok, set x and y
            (setf x (car arg)) (setf y (cadr arg))
            (format t "Error: Invalid coords ~A ~%" arg)))
        ; anything else is a bad command
        (t (format t "Bad command ~A ~%" cmd))))))
