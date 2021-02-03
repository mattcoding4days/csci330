; create and return a new empty stack
(defun stack () nil)

; return true iff S is a stack ( i.e a list)
(defun stackp (S)
  (listp S))

; return true iff S is an empty list
(defun empty (S)
  (if (stackp S)
    (null S)
    'error))

; return the current stack size
(defun size (S)
  (if (stackp S)
    (length S)
    'error))

; push an element onto the stack (returns the new stack or 'error)
(defun s_push (S e)
  (if (stackp S)
    (cons e S)
    'error))

; return the top element of a stack
(defun s_top (S)
  (if (and (stackp S) (not (null S)))
    (car S)
    'error ))

; pop the top element off a stack (returns the new stack or 'error)
(defun s_pop (S)
  (if (and (stackp S) (not (null S)))
    (cdr S) 'error))
