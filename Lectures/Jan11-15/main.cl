#! /usr/bin/gcl -f

;; type checking

#|
For every built-in data type, there are built-in
type checking funcitons for said data type
|#

;; check the type of something
;(type-of 105.3)


(defun handle-error (errormsg)
  (format t "Error: ~A ~%" errormsg)
  (quit 1))

(defun checker (intOne intTwo)
  (if (not (and (integerp intOne) (integerp intTwo)))
    (return-from checker nil)
    )
  (return-from checker t))

(defun main ()
  (if (not (checker 1.23 3))
    (handle-error "Type mis-match"))

  (format t "All types are correct ~%"))

;; init main
(main)
