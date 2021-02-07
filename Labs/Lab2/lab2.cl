
(defun f (N &optional (next 3) (older 1) (recent 1))
  (cond
    ( (not (integerp N)) nil)
    ( (< N next) recent)
     
    (t (f N (+ next 1) recent (+ older recent)))))


;(defun fhelper (N next older recent)
  ;(cond
    ;( (< N next) recent)
    ;(t (fhelper N (+ next 1) recent (+ older recent)))))


(defun gt (M &rest R)
  "return a list of all the parameter values that were integers greater than M"

  ; flatten the list if necessary
  (if (listp (car R))
    (setf R (car R)))

  (cond
    ( (not (realp M)) nil)
    ( (null R) nil)
    
    ( (not (realp (car R))) (gt M (cdr R)))

    ( (> (car R) M) (cons (car R) (gt M (cdr R))))

    (t (gt M (cdr R)))))


(defun isTree (tree)
  "Only verify one section of the 'tree'"
  (cond
    ( (null tree) t)
    ( (not (and (listp tree)
                (listp (car tree))
                (integerp (cadr tree))
                (listp (cddr tree)))) nil)
    (t)))


(defun sumTree (tree)
  (format t "~A ~%" tree)
  (cond
    ( (not (isTree tree)) 'Error)
    ( (+ (sumTree (cons (cadr ))) )
    ))
