#! /usr/bin/gcl -f



; Label blocks are much like let blocks, except that we're defining
; local functions instead of local variables.

; We create a list of local functions which can be called from anywhere
; in the "body" of a label block

; These support local recursive calls

; It will be very common to put a let block inside a function and then
; put a label block inside the let


;;;; Simple example

(defun foo (a)
  (labels ( ; start defining list of functions
            (print (n)
                   (format t "~A ~%" n) (if (> n 0) (print (- n 1))))
            ) ; end of the list of local funcitons

    ; start of body of label block
    ; if a looks ok then call print on it
    (if (and (integerp a) (> a 0)) (print a))))

(foo 5)


;;;; More involved example

; return a dispatch function to work with binary search trees




; try it out
(defun treeBuilder ( )
  (let
    ( (root nil) ) ; empty tree to start with
    
    (labels
      (
       (insert (tnode N)
          (cond
            ; if N belongs on left
            ((and (< N (cadr tnode)))
              ; see if left is empty or not
              (if (null (car tnode))
                  (setf (car tnode) (list nil N nil))
                  (insert (car tnode) N)))
            
            ; else N belongs on right
            ; is right empty?
            ((null (caddr tnode)) (setf (caddr tnode) (list nil N nil)))

            ; general right case
            (t (insert (caddr tnode) N))))

        ; print the raw tree structure
        (printADT ( ) (format t "tree structure: ~A ~%" root))

        ; print the tree data, inorder traversal (left:val:right)
        (printTree (tnode)
          (unless (null tnode)
            (printTree (car tnode))
            (format t " ~A" (cadr tnode))
            (printTree (caddr tnode))))

        ) ; end of labels list
        
      ; return the lambda function
      (lambda (cmd &optional (arg nil))
        (cond
          ; 'print
          ((equalp cmd 'print)
            (format t "Tree content: ")
            (printTree root)
            (format t "~%"))
          
          ; 'insert n
          ((equalp cmd 'insert)
            (when (integerp arg)
              (if (null root)
                (setf root (list nil arg nil))
                (insert root arg)))
            (unless (integerp arg)
              (format t "Error: invalid insert value ~A~%" arg)))

          ; 'debug
          ((equalp cmd 'debug) (printADT))

          ; default
          (t (format t "Error: invalid command ~A~%" cmd)))
        ) ; end of lambda
      ) ; end of internal labels functions
    ) ; end of let
  ) ; end of function



(defvar x (treeBuilder))
(funcall x 'insert 4)
(funcall x 'insert 6)
(funcall x 'insert 2)
(funcall x 'insert 1)
(funcall x 'insert 3)
(funcall x 'insert 5)
(funcall x 'insert 7)

(funcall x 'print)
(funcall x 'debug)

; failures
(funcall x 'foo)
(funcall x 'insert "blah")



