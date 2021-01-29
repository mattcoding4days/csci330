#! /usr/bin/gcl -f

; load modules
(load "lab1.cl")

;; set debugging and print case
(si::use-fast-links nil)
(setq *print-case* :capitalize)


;; test code for checker
(defun test-checker-first-param-wrong ()
  "first param list instead of integer"
  (let 
    ( (retval (checker '(1 2 3) 2) ))
    (if (eq retval 'Error)
      (format t "test-checker-first-param-wrong: Pass~%")
      (format t "test-checker-first-param-wrong: Fail~%")))) 

(defun test-checker-second-param-wrong ()
  "second param integer instead of list"
  (let 
    ( (retval (checker 3 2) ))
    (if (eq retval 'Error)
      (format t "test-checker-first-param-wrong: Pass~%")
      (format t "test-checker-first-param-wrong: Fail~%")))) 

(defun test-checker-list-length-greater ()
  "list length is greater than N"
  (let 
    ( (retval (checker 2 '(1 2 3) )))
    (if retval
      (format t "test-checker-list-length-greater: Pass~%")
      (format t "test-checker-list-length-greater: Fail~%")))) 

(defun test-checker-list-length-lesser ()
  "list length is lesser than N"
  (let 
    ( (retval (checker 5 '(1 2 3) )))
    (if (not retval)
      (format t "test-checker-list-length-greater: Pass~%")
      (format t "test-checker-list-length-greater: Fail~%")))) 

(test-checker-first-param-wrong)
(test-checker-second-param-wrong)
(test-checker-list-length-greater)
(test-checker-list-length-lesser)
