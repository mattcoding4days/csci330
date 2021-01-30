(defun checker (N L)
  "takes two params, expects int N and list L"
  ; check types
  (cond
    ( (not (and (integerp N) (listp L))) 'Error)
    ; if length of List is > N return T
    ( (> (length L) N) T)
    (Nil)))

(defun processor (L1 L2)
  "takes two params, expects both to be lists"
  ; if either (or both) is not a list returns 'Error
  (cond
    ( (not (and (listp L1) (listp L2))) 'Error)

    ; goes through two lists recursively, returns nil if either list is empty
    ( (or (null L1) (null L2)) Nil)

    ; otherwise returns result of cons'ing the result of calling checker
    ; on the head of each list to result of recursive call on the tails of both lists

    ( (cons (checker (car L1) (car L2) ) (processor (cdr L1) (cdr L2)) ))))


(defun main ()
  "prompts the user to enter two lists"
  (format t "Enter two lists: ")
  (format t "Result is: ~A ~%" (processor (read) (read) )))
