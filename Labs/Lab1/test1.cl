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
      (format t "test-checker-second-param-wrong: Pass~%")
      (format t "test-checker-second-param-wrong: Fail~%"))))

(defun test-checker-params-correct ()
  "both parameters obey spec"
  (let
    ( (retval (checker 2 '(1 2 3 4 5)) ))
    (if retval
      (format t "test-checker-params-correct: Pass~%")
      (format t "test-checker-params-correct: Fail~%"))))

(defun test-checker-list-length-greater ()
  "list length is greater than N"
  (let 
    ( (retval (checker 2 '(1 2 3)) ))
    (if retval
      (format t "test-checker-list-length-greater: Pass~%")
      (format t "test-checker-list-length-greater: Fail~%")))) 

(defun test-checker-list-length-lesser ()
  "list length is lesser than N"
  (let 
    ( (retval (checker 5 '(1 2 3)) ))
    (if (not retval)
      (format t "test-checker-list-length-lesser: Pass~%")
      (format t "test-checker-list-length-lesser: Fail~%"))))

(defun test-processor-params-correct ()
  "pass two list paramaters to processor"
  (let
    ( (retval (processor '(1 2 3) '(4 5 6)) ))
    (if retval
      (format t "test-processor-params-correct: Pass~%")
      (format t "test-processor-params-correct: Fail~%"))))

(defun test-processor-params-wrong-first ()
  "pass string instead of list for first param"
  (let
    ; test first param
    ( (retval (processor "wrong" '(1 2 3)) ))
    (if (eq retval 'Error)
      (format t "test-processor-params-wrong-first: Pass~%")
      (format t "test-processor-params-wrong-first: Fail~%"))))

(defun test-processor-params-wrong-second ()
  "pass string instead of list for second param"
  (let
    ; test first param
    ( (retval (processor '(1 2 3) "wrong") ))
    (if (eq retval 'Error)
      (format t "test-processor-params-wrong-second: Pass~%")
      (format t "test-processor-params-wrong-second: Fail~%"))))



(test-checker-first-param-wrong)
(test-checker-second-param-wrong)
(test-checker-params-correct)
(test-checker-list-length-greater)
(test-checker-list-length-lesser)
(test-processor-params-correct)
(test-processor-params-wrong-first)
(test-processor-params-wrong-second)


(main)
