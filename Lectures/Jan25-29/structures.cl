#! /usr/bin/gcl -f

; name of the struct is Fraction, num and den are fields
(defstruct Fraction num denom)

; there are functions that are generated for us
(defvar myFrac (make-Fraction)) ; returns a new unitilialized Fraction struct

; setters
(setf (Fraction-num myFrac) 4) ; set numerator to 4

(setf (Fraction-denom myFrac) 5) ; set denominator to 5

(Fraction-p myFrac) ; returns t iff x is a fraction

(Fraction-num myFrac) ; return the num field of myFrac

(Fraction-denom myFrac) ; return the denom field of myFrac


; can also initialize fields
(setf g (make-Fraction :num 11 :denom 27))

(format t "Numerator: ~A ~%" (Fraction-num g))
(format t "Denominator: ~A ~%" (Fraction-denom g))
