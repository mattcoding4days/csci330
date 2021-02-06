
; next = 3 older 1 recent 1

(defun f (N &optional (next 3) (older 1) (recent 1))
  (cond
    ( (not (integerp N)) nil)
    ( (< N next) recent)
     
    (t (f N (+ next 1) recent (+ older recent)))))


(defun fhelper (N next older recent)
  (cond
    ( (< N next) recent)
    (t (fhelper N (+ next 1) recent (+ older recent)))))


(defun gt (M &rest R)
  "return a list of all the parameter values that were integers greater than M"
  (format t "~A ~%" R)
  (cond
    ( (not (realp M)) nil)
    ( (null (car R) nil))
    ( () )
    ))


(defun isTree (tree)
  (cond
    ( (null tree) t)
    ( (not (or (listp tree)
               (listp (car tree))
               (integerp (cadr tree))
               (listp (cddr tree)))) nil)
    (t)))


(defun sumTree (tree)
  )
