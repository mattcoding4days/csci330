#! /usr/bin/gcl -f


; make some test data
(defvar data '("Hello there" "from csci 330" "blah bla bla" "a 330 goodbye"))

; open the pipe to the command
(defvar p (open "| grep 330" :direction :output))

; send each data string to the pipe, grep should pick out the ones containing 330
(dolist (s data) (format p "~A~%" s))

; close the pipe
(close p)
