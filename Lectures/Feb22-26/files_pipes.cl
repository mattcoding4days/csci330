#! /usr/bin/gcl -f

;; Helpful file manipulation functions

;; (probe-file fname) - return t iff the file exists
;; (file-author fname) - return name of file  author/owner
;; (file-write-date fname) - look up modification date
;; (file-namestring fname) - extract just the name (useful where fname includes the path)
;; (directory-namestring fname) - extract just the path (omit the file name)
;; (delete file fname) - delete the file


;; expects first param to be a pair (streamname filename)
;; (with-open-file)

;; optional params
;; :direction :output
;; :if-exists :overwrite
;; :if-does-not-exist :create

;;;;; Once open

;; (read-line streamname nil)
;; (format streamname " what ever you want to write to the file")
;; (file-length streamname)
;; (file-position streamname)


;; open a file and write something to it
(with-open-file (mystream "somefile" :direction :output)
  (format mystream "Writing to the file"))


;; open a file and read a line from it, store in global variable
(defvar content nil)
(with-open-file (s "somefile")
  (setf content (read-line s nil)))
(format t "Content read was: '~A'~%" content)

;; won't create the file if it does not exist
;; loop to read entire file line by line
(with-open-file (s "testfile")
  (do
    ; declare local loop variables, init value, update statement
    ( (nextline (read-line s nil) (read-line s nil)) )

    ; stop when nextline is null
    ( (null nextline) (format t "Reached the end of the file~%") )

    ; loop body, just displays current line
    (format t "Just read: ~A~%" nextline)))

