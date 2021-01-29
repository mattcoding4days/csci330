#! /usr/bin/gcl -f

; turn on debugging
(si::use-fast-links nil)

; setting printing case
(setq *print-case* :capitalize)

;; Sequences, lists, arrays, vectors, strings

;; Quotes and sequences/lists/etc
(si::use-fast-links nil)

(defvar my-set
  (quote (1 2 3 4 5 6)))


(print (type-of my-set)) ; this will be a cons

; (sqrt 35) ; this will be a function call in lisp

; '(sqrt 35) ; this will tell lisp that this is a list of values

(defvar x '(1 2 3))
(print (type-of x)) ; this will be a cons

(defvar y (quote (1 2 3)))
(print (type-of y)) ; this will be a cons

; x and y use ' and quote, they mean the same thing

; 'x means the symbol x, don't evaluate as the variable x or function
; name x

; Built in functions that work on sequences

(defvar s1 '(0 2 3 10 5 6))
(format t "Length of s1: ~A ~%" (length s1)) ; returns the length
(elt s1 2) ; return the ith element of s. here it will return the 2nd element

(defvar x 66)
(format t "Setting third element: ~A ~%" (setf (elt s1 2) x)) ; sets the ith (2nd element in the list to x

(format t "Count how often 2 appears: ~A ~%" (count 2 s1)) ; counts how often 2 appears in s

(format t "Remove all 2's: ~A ~%" (remove 2 s1)) ; removes all 2's from s

(format t "Making a deep copy: ~A ~%" (copy-seq s1)) ; returns a deep copy of s, two truly seperate sequences


;(format t "Sorting using less than operator: ~A ~%" (sort s1 '>)) ; sorts s using an operator for comparison.


(defvar s2 '(10 20 30 40 50 60))

; concatenate two sequences, here type can be a 'list 'string or 'vector
; (concatenate cons s1 s2)

; LIST SPECIFIC FUNCTIONS
(format t "~%~%Lists~%")

(defvar L1 '(1 2 3 4))
(format t "New List L1: ~A ~%" L1)

; cons adds a new item to the FRONT of a list
(defvar L2 (cons 0 L1))
(format t "New List L2: ~A ~%" L2)

(format t "Return front of list with car: ~A ~%" (car L1))

(format t "Return tail of list with cdr: ~A ~%" (cdr L1))

(format t "Get 0th element from L1: ~A ~%" (nth 0 L1))

(format t "Get last element in L1: ~A ~%" (last L1))

(format t "Check for a member (2) is in a list L1: ~A ~%" (member 2 L1))

(format t "Check for a member (33) is in a list L1: ~A ~%" (member 33 L1))

(format t "(null L) to see if list is empty: ~A ~%" (null L1))

(format t "append, return a new list built from L1 and L2: ~A ~%" (append L1 L2))

(format t "~%~%Combinations of car and cdr~%")

#|
car = content-address-register
cdr = content-decrement-regist
|#

(format t "L1: ~A ~%" L1)

; (car (cadr L1))
(format t "Get head of the tail L1: ~A ~%" (cadr L1))
(format t "Get next head of tail of the head L1: ~A ~%" (caddr L1))
(format t "Get the tail of the tail of L1: ~A ~%" (cddr L1))
; example count elements recursively
(defun countElements (L)
  (cond 
    ( (not (listp L)) nil)
    ( (null L) 0)
    (t (+ 1 (countElements (cdr L))))))


(defvar elems (countElements L1))
(format t "There are : ~A elements ~%" elems)

(format t "Custom append function~%")

(defun appender (L1 L2)
  (cond
    ( (or (not (listp L1)) (not (listp L2)) ) nil)
    ( (null L1) L2)
    ( (null L1) L2)
    (t (cons (car L1) (appender (cdr L1) L2)))))

(format t "~%Appending two lists: ~A ~%" (appender '(1 2 3 4) '(2 3 4 5)))


(format t "~%Reverse a List~%~%")

; will use a helper function and build up a list of the elements
; we've reversed so far

(defun reverser (L)
  (if (not (listp L ))
    nil
    (revHelp L '() )))

; sofar is known as an 'accumulator'
(defun revHelp (LR sofar)
  (cond
    ( (null LR ) sofar)
    (t(revHelp (cdr LR) (cons (car LR) sofar))) ))

(format t "~A ~%" (reverser '(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18)))


; Arrays
(format t "~%~%Arrays~%~%")

; can create multidimensional arrays
(defvar my-array (make-array '(4 3) :initial-element 27)) ; returns a 3x4 array, initialized to 27
(format t "4x3 array initialized to 27: ~A ~%" my-array)

; can loop up dimension list using array-dimensions
(format t "Dimensions of array: ~A ~%" (array-dimensions my-array))

(loop for iter in my-array do
     (format t "~A ~%" (array-dimension my-array iter)))
