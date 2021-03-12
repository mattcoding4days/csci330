#! /usr/bin/gcl -f

;;;; Simple pipe example

(let ((mypipe (open "| ls")))
  (do
    ; local vars
    ((nextline (read-line mypipe nil) (read-line mypipe nil)))

    ; stopping condition
    ((null nextline) (close mypipe))

    ; body, echoing what was read
    (format t "Read: ~A ~%" nextline)))
