(defun make-board (rows columns)
(make-list rows :initial-element (make-list columns :initial-element nil)))

(defun print-items (items)
(mapcar (lambda (item) (if (null item)(format t "| - ") (format t "| ~A " item))) items)
(format t "|~%"))

(defun print-matrix (board)
  (dotimes (i (length board))
    (print-items (nth i board))))

(defun place-tok (board col player)
  (if (not (null board))
      (if (null (nth col (first (last board))))
	  (setf (nth col (first (last board))) player)
	(place-tok (butlast board) col player )))
  (board))