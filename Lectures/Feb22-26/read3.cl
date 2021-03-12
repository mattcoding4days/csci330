#! /usr/bin/gcl -f

(defun processFile (filename)
  (format t "Processing: '~A' ~%" filename)
  (let ((a nil) (b nil) (c nil))
    (with-open-file (stream filename)
      (setf a (read stream))
      (setf b (read stream))
      (setf c (read stream)))
    (list a b c)))

; main body of the script
(let ((fname nil) (result "incomplete"))
  (format t "Enter a filename: ")
  (setf fname (read-line))
  (cond
    ((not (stringp fname))
     (format t "Error: '~A' cannot be a filename~%" fname))
    ((not (probe-file fname))
     (format t "Error: '~A' not accessible~%" fname))
    (t (setf result (processFile fname))))
  (format t "Final status: ~A~%" result))
