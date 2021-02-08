
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

  ; flatten the list if necessary, since &rest will wrap a list in a list,
  ; reset the nested list to the inner list. Since cond seems to force a return
  ; upon us, use the if statement instead.
  (if (listp (car R))
    (setf R (car R)))

  (cond
    ; if M is not a real number, return nil
    ( (not (realp M)) nil)

    ; if the List R is empty, then return nil
    ( (null R) nil)
    
    ; if the head of car is not a real number, then
    ; omit it in the recursive call
    ( (not (realp (car R))) (gt M (cdr R)))
  
    ; if the head of car is greater than M we want to keep it,
    ; cons it on to the head of the list returned from the recursive
    ; call to gt that takes the tail of the list
    ( (> (car R) M) (cons (car R) (gt M (cdr R))))
    
    ; this is to filter out numbers >= M, this could probably be a compound
    ; conditional with (not (reall (car R) for non real numbers. But compounds
    ; seem to give me unneccessarry problems in lisp, so this is the way.
    (t (gt M (cdr R)))))


(defun isTree (tree)
  "Verify a single leaf of the 'tree'"
  (cond
    ; if entire object isnt a list, it isn't a tree
    ( (not (listp tree)) nil)

    ; if the entire tree is empty, it is
    ; valid, return 0
    ( (null tree) 0)

    ; if the first element in the tree is not a list, its an invalid tree
    ( (not (listp (car tree))) nil)

    ; if the second element in the list isn't an integer than its an invalid tree
    ( (not (integerp (cadr tree))) nil)

    ; if the last element isnt a list, than its invalid
    ( (not (listp (caddr tree))) nil)
    
    ; else it is valid
    (t)))


(defun sumTree (tree)
  "sum the contents of a binary tree"
  ;(format t "~A ~%" tree)
  ; if the tree is invalid, than return error

  (cond
    ; check index 0
    ( (not (isTree (car tree)))
     'error "Not a valid tree")
    
    ; check index 2
    ( (not (isTree (caddr tree)))
     'error "Not a valid tree")
 
    ; if the contents of the tree is empty, the sum of that leaf is 0
    ( (eq (isTree tree) 0) 0)
    
    ; Here: we call sum tree recursively on the elements in the tree that are a list,
    ; and accumulate the results in the the addition function that is wrapping the
    ; recursive calls
    ( (+ 
        (sumTree (car tree))
        (cadr tree)
        (sumTree (caddr tree))))))

