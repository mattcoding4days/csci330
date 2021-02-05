#! /usr/bin/gcl -f


;; defvar creates a dynamically scoped variables
(defvar x "global")

(defun h ( )
  (format t "Using ~A ~%" x))

(defun f ( )
  (let
    ((x "f"))
    (h)))

(defun g ( )
  (let
    ((x "g"))
    (h)))

(f)
(g)
(h)
