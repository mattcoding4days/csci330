#! /usr/bin/gcl -f



(format t "Optional parameters with default values ~%~%")

(defun f
  ; params
  (w x &optional (y 10) (z "foo"))
  "regular parameters come first, then use the &optional keyword,
   from that point on give pairs with the name and default value"
  (format t "Regular params: ~A ~A ~%" w x)
  (format t "Optional params: ~A ~A ~%" y z))

;; if 2 params: defaults are used for y and x
(f 45 67)

;; if 3 params: third goes to y and default for z
(f 45 67 89)

;; if 4 params: third goes to y and fourth to z
(f 45 67 89 100)

(terpri)
(terpri)


(format t "parameter lists which accept any number of arguments (Variadic) ~%~%")

(defun g (x &optional (y 1.5) &rest L)
  "mandatory first, then optional, then variatic parameters"
  (format t "Mandatory: ~A ~%" x)
  (format t "Optional: ~A ~%" y)
  (format t "Variaditc ~A ~%" L))


(g 1)                   ; y uses default, L is nil
(g 1 2)                 ; x=1, y=2, L is nil
(g 1 2 3)               ; x=1, y=2, L is (3)
(g 1 2 '(3 4 5) 6 7 8)  ; x=1, y=2, L is ((3 4 5) 6 7 8)



(terpri)
(terpri)


(format t "parameters passed by keyword instead of position ~%~%")

(defun display (&key element mylist)
  (format t "~%You passed:~%element: ~A~%mylist:~A ~%" element mylist))

(display :element 3 :mylist '(10 20 30))
(display :mylist '(40 50 60) :element 4)

(terpri)
(terpri)
