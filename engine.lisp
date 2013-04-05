(defun make-board (rows columns)
(make-list rows :initial-element (make-list columns :initial-element 0)))

(defun print-items (items)
(mapcar (lambda (item) (if (null item)(format t "| - ") (format t "| ~A " item))) items)
(format t "|~%"))

(defun print-matrix (board)
  (dotimes (i (length board))
    (print-items (nth i board))))

(defun place-tok (board col player)
	(place-tok-h (reverse board) col player)
)

(defun place-tok-h (board col player)
(if (null (nth col (first board)))
	(setf (nth col (first board)) player)
	(place-tok-h (rest board) col player))
	(reverse board)
}