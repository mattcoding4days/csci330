;; get int
(defun getint (&optional (param-min most-negative-fixnum) (param-max most-positive-fixnum))
  (let* ( (userval 0)
          (realmin (if (integerp param-min)
                     param-min
                     most-negative-fixnum))
          (realmax (if (and (integerp param-max) (<= realmin param-max))
                     param-max
                     most-positive-fixnum)))
    (cond
      ( (and (= realmax most-positive-fixnum) (= realmin most-negative-fixnum))
          (format t "Enter an integer: "))

      ( (= realmin most-negative-fixnum)
          (format t "Enter an integer smaller than ~A: " realmax))
      ( (= realmax most-positive-fixnum)
          (format t "Enter an integer greater than ~A: " realmin))
      (t (format t "Enter an interger in the range ~A to ~A: " realmin realmax)))

    (setf userval (read))
    (cond
      ( (not (integerp userval))
        (block 'invalidtype
          (format t "That was not an integer, please try again ~%")
          (getint realmin realmax)))
      ( (< userval realmin)
        (block 'toosmall
          (format t "That was too small, please try again ~%")
          (getint realmin realmax)))
      ( (> userval realmax)
        (block 'toobig
          (format t "That was too large, please try again ~%")
          (getint realmin realmax)))
      (t userval))))


; tail recursive function for going through a list of values and finding the smallest
(defun smallestInt (L &optional (sofar most-positive-fixnum))
  (let
    ; will use local var to replace sofar if it is invalid
    ( (realSofar (if (integerp sofar) sofar most-positive-fixnum)))

    (cond
      ( (or (not (listp L)) (null L)) realSofar)

      ( (not (integerp (car L))) (smallestInt (cdr L) (realSofar)))

      ( (< (car L) realSofar) (smallestInt (cdr L) (car L)))

      (t (smallestInt (cdr L) realSofar)))))
