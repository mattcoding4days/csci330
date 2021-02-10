#! /usr/bin/gcl -f

; metaprogramming: Functions that write customized versions of other functions
; are often referred to as closures.

; Example Basic process: Write a function that takes a parameter or two and uses those
; plus lambda to create and return some new function

; Call our write, store the returned function in a variable, and test it using
; funcall or apply

; Function using a name in a msg.

(defun buildPrt (username)
  (if (not (stringp username))
    (setf username "Invalid username"))
  (lambda (msg)
    (if (not (stringp msg))
      (setf msg "Invalid message"))
    (format t "~A ~A ~%" username msg)))


(defun buildPrtFancy (username)
  (let
    ( (realname (if (stringp username)
                  username
                  (format t "Error: invalid username given: ~A ~%" username))))
    (lambda (msg)
      (if (stringp msg)
        (format t "~A::~A~%" realname msg)
        (format t "Error: invalid msg supplied (~A) is message for ~A ~%" msg realname)))))


(defvar prt (buildPrt "Super me"))
(defvar prt2 (buildPrt "Someone Else"))

(funcall prt "Wants to go home")


(funcall prt2 "does not want to go home")


(defvar prtFancy (buildPrtFancy "Matt"))
(defvar prtFancy2 (buildPrtFancy 12))


(funcall prtFancy "Is awesome")
(funcall prtFancy2 "Is awesome")


; time dialation forumula

(defun timeBuilder (sp)
  (if (and (realp sp) (> sp 0))
    ; valid speed, generate lambda function
    (lambda (tm)
      (if (and (realp tm) (> tm 0))
        (* tm (sqrt (- 1 (/ (* sp sp) 90000000000))))
        (format t "Error: Invalid time ~A ~%" tm)))
    ; invalid speed
    (lambda (tm)
      (format t "Error: Invalid speed ~A ~%" sp))))

; 11 km per second
(defvar bobtime (timeBuilder 60000))

;; 1000 days has passed for us
(format t "Bob has has been travelling for ~A days~%" (funcall bobtime 1825))
