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

(defun winHor (board win)
	(let ((allwin nil))
		(dotimes (col (length board) allwin)
			(dotimes (row (- (length (car board)) (- win 1)))
				(let ((start  row))
					(if (< (+ start win) (- (length (car board)) 1))
						(let ((winner ( nth row (nth col))))
							(dotimes (winRow win winner)
								(if (eq (nth (+ winRow start) (nth col)) winner)
 									(set winner (nth (+ winRow start) (nth col)))
									(set winner nil)
								)
							)
						(if (/= winner nil)
							(set allwin winner)))))))))
							
(defun winCol (board win)
	(let ((allwin nil))
		(dotimes (row (length (car board) allwin))
			(dotimes (col (- (length board) ( - win 1)))
				(let ((start cols))
					(if (< (+ start win) (- (length board) 1))
						(let ((winner (nth row (nth col))))
							(dotimes (winCol win winner)
								(if (eq (nth row (nth (+ winCol start))) winner)
									(set winner (nth row (nth (+ winCol start))))
									(set winner nil)
								)
							)
						(if (/= winner nil)
							(set allwin winner)))))))))
		
		
		

(defun place-tok (board col player)
  (if (not(null (nth col (first (last board)))))
	  (place-tok (butlast board) col player ) (setf (nth col (first (last board))) player)))