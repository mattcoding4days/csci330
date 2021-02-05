#! /usr/bin/gcl -f

; take a group of statements and block them together and run them in sequence.

; a block returns the last value 
(block
  BLAH
  (format t "Enter something: ")
  (read))


; the firt arguments to let must be variables and their initializations
; One complication is, 'let' blocks give no gaurentee which variable is assigned what

(let
  ((x 5)
   (y "foo"))
  (format t "Enter two items: ")
  (setf x (read))   ; set local x to first thing read
  (setf y (read))  ; det local y to first read
  (list x y))       ; return a list of the two values


; let* acts like let, except initializes local vars in order given
(let* ((a (read))
       (b (read)))
  (format t "~A ~A ~%" a b))

; guaranteed to read into a first, and b second

; useful when you want to init one local variable from another

(let* ((x (read))
       (b (if (numberp x)
            (* x x) 0))))


(defun f (a b)
  (let
    ((x 1) (y nil))
    (format t "~A ~A ~%" a b)
    (format t "~A ~A ~%" x y)))

(f 34 56)
