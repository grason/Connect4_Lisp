(defun make-board (rows columns)
;; this is pretty non-functional :)
(loop for x from 1 to rows
      collect (loop for y from 1 to columns
		    collect nil) ))

(defun print-items (items)
(mapcar (lambda (item) (if (null item)(format t "| - ") (format t "| ~A " item))) items)
(format t "|~%"))

(defun print-matrix (board)
  (dotimes (i (length board))
    (print-items (nth i board))))

(defun place-tok (board col player)
  (if (not(null (nth col (first (last board)))))
	  (place-tok (butlast board) col player ) (setf (nth col (first (last board))) player)))