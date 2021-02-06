#! /usr/bin/gcl -f


; create and destroy tables
; add and remove key/value pairs
; check if key is present in current table
; update value associated with key
; look of a value associated with key
; iterate through the pairs based on keys
; collect list of values and/or list of keys
; run a function on every key/value pair

(defvar k "Matthew")
(defvar v "Williams")

; create and return table
(setf myTable (make-hash-table))

; look up size of table (number of pairs)
(hash-table-count myTable)

; add/update key value pair, k is my key, v is the value
(format t "~A ~%" (setf (gethash k myTable) v))

; remove key/value pair
;(remhash k myTable)

; look up value associated with key (nil if key not present)
(format t "~A ~%" (gethash k myTable))

; iterating through keys
(loop for key being the hash-keys of myTable do
  (format t "~A ~%" key))

; loop through and collect all the keys
(format t "~A ~%" (loop for key being the hash-keys of myTable collect key))

; loop through and get list of values
(defun getValues (key)
  (loop for key being the hash-keys of myTable collect
      (gethash key myTable)))

(setf allvalues (getValues k))
(format t "~A ~%" allvalues)

; get a list of the key value pairs
;(loop for key being the hash-keys of myTable collect
  ;(list keys (gethash key myTable)))

;(format t "~A ~%" key)


()
