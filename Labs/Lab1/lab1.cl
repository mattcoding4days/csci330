(defun checker (N L)
  "takes two params, expects int N and list L"
  ; check types
  (cond
    ( (not (integerp N)) 'Error)
    ( (not (listp L)) 'Error)
    ( (> (length L) N) T)
    (Nil)))

(defun processor (L1 L2)
  "takes two params, expects both to be lists"
  ; if either (or both) is not a list returns 'Error

  ; goes through two lists recursively, if either list is empty
  ; it returns nil
  ; otherwise, returns result of cons'ing the result of calling checker
  ; on head of each list to result of recursive call on the tails of the
  ; two lists
  (format t "processor called on ~A, ~A ~%" L1 L2))

(defun main ()
  "prompts the user to enter two lists"
  (format t "Enter two lists: ")
  (processor (read) (read))
  )
