#! /usr/bin/gcl -f

;;;; do list

(defvar L '(1 2 3 4 5 6 7 8 9 10))

(dolist (el L)
  (format t "~A " el))

(terpri)
(terpri)

;;;; dotimes

; define local coutner, the number of times to repeat an action,
; what to return when finished and the action to be performed
; this is basically SIGMA, starts and 0 and goes to N-1

(defvar ret (dotimes (x 4 (* x x))
  (format t "~A " x)))

(terpri)
(format t "do times returns: ~A~%" ret)
(terpri)


;;;; do

; The do construct is structured but powerful: we specify three key parts

; * List of local variable definitions, each of which specifies
;   the name, initial value, and how to update it each pass
;
; * list of the stopping condition then any actions to take
;   and value to return once the stopping condition is met
;
; * anything left is the body of the loop (sequence of statements
;   to execute each pass through the loop

; example x=5, y=100, keep doubling x until x > y, at each stop print both.
; when it stops, print x*y then return x+y

(do ; first, a list of local variable settings
  ((x 5 (* x 2)) (y 100 (+ y 1)))

  ; sencond, a list of the stop condidition and any actions
  ; the last action determines the return value
  ((> x y) (format t "~A " (* x y)) (+ x y))

  ; remaining statements are the body of the loop
  (format t "x: ~A :: y: ~A~%" x y))

(terpri)


;;;; loop

; very flexible form, can specify a loop name, set of local variable specs,
; and a set of actions on the vars

;(loop named Foo
  ;for x in '(10 20 30 40 50)
  ;for count from 5 ; increments count by 1 each time
  ;while (and (/= 30 x) (< count 7))
  ;do (...whatever with the current value of x, count))
