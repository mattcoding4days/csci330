
(defun f (N)
  (cond
    ( (not (integerp N)) nil)
    ( (< N 3) 1)
    (t (fhelper N 3 1 1))))

(defun fhelper (N next older recent)
  (cond
    ( (< N next) recent)
    (t (fhelper N (+ next 1) recent (+ older recent)))))

(defun gt (M &rest R)
  )

(defun isTree (tree)
  )

(defun sumTree (tree)
  )
