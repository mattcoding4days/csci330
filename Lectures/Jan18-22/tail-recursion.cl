#! /usr/bin/gcl -f

;; A function call is tail-recursive if the result of each
;; recursive call is immediately returned, and not processed
;; before returning, basically, after a recursive call you can't
;; process any other code after the recursive call

;; example

(defun f (x)
  (cond
    ( (not (numberp x)) nil)
    ( (> 0 x) (f (-x)))
    ( (< 1 x) (f (/ 1 x)))
    (t(sqrt x))))


(defun smallest (L)
  (if (listp L) (smallhelper L most-positive-fixnum)))

; we need to add an extra parameter to implement tail recursion,
; here it is sofar, these paramaters are called accumulators
(defun smallhelper (L sofar)
  ; At everystage, compare the front of L to the smallest thing we have seen
  ; so far, if the front of L is smaller that sofar, than that is the new sofar
  (cond
    ; if L is empty return sofar as the final answer
    ( (null L) sofar)
    ; if front of L is not an integer, ignore it and recursive call on
    ; the tail of the list, using the smallest thing we've seen so far 
    ( (not (integerp (car L))) (smallhelper (cdr L) sofar))
    ; if we pass this, head of list is integer.
    ; test if head of list is smaller than sofar
    ( (< (car L) sofar)
       ; if true then head of list is the new sofar
       (smallhelper (cdr L) (car L)))
    ; default is the head of list is larger than sofar, so lets check the
    ; remainder of the list to see if its smaller than sofar
    (t (smallhelper (cdr L) sofar))))


