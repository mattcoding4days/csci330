#! /usr/bin/gcl -f

; check the fields are valid then create/return a new student record
(defun studentRec (name stnum email)
  (cond
    ( (not (stringp name)) 'error)
    ( (not (integerp stnum)) 'error)
    ( (not (stringp email)) 'error)
    (t (list name stnum email))))

; return t iff S is a valid student record
(defun studentRecP (S)
  (cond
    ( (not (listp S)) nil)
    ( (not (= (length S) 3)) nil)
    ( (not (stringp (nth 0 S))) nil)
    ( (not (integerp (nth 1 S))) nil)
    ( (not (stringp (nth 2 S))) nil)
    (t t)))

; change the name in a student record
(defun changeName (S name)
  (cond
    ( (not (studentRecP S)) 'error)
    ( (not (stringp name)) 'error)
    (t (setf (nth 0 S) name) )))

(defvar ferd (studentRec "fred" 123 "fred@gmail.com"))
(format t "student record ferd: ~A~%" ferd)
(format t "is ferd valid: ~A~%" (studentRecP ferd))
(changeName ferd "Bob")
(format t "after name change to bob: ~A~%" ferd)
