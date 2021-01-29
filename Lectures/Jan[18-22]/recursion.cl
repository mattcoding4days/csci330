#! /usr/bin/gcl -f

#|

  Typical function setup:
  -----------------------
  * Error-check the parameters
  * Check for base cases
  * Handle general/recrusive cases

|#


; Basical recursive function

; Find smallest integer in list, skip non integers, return most
; positive-fixnum if list contains no integers, nil if not a list

(defun smallest (L)
  ; print L for demonstration purposes
  (format t "(smallest ~A) ~%" L)
  (cond
    ; if it's not a list return nil
    ( (not (listp L)) nil)
    
    ; the default return value is the biggest possible integer
    ( (null L) most-positive-fixnum)

    ; if the front element isn't an integer then
    ;   return the smallest from the rest of the list 
    ( (not (integerp (car L))) (smallest (cdr L)))

    ; see if the front element is smaller than anything in the rest of the list
    ( (< (car L) (smallest (cdr L))) (car L))

    ; the front element isn't the smallest,
    ;   so get the smallest element from the rest of the list
    (t (smallest (cdr L)))))


(format t "Enter a list: ")
(defvar data (read))
(defvar result (smallest data))
(format t "Smallest integer is: ~A ~%" result)
