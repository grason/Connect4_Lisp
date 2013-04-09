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

(defun vert-transform (board) 
    (loop for y from 0 to (- (length (first board)) 1)
	collect (loop for x from 0 to (- (length board) 1)
	collect (nth y (nth x board)))))

;working, don't change
(defun diag-transform-down-top (board)
	(loop for y from 0 to (- (length (first board)) 1)
		collect (loop for x from 0 to y
			collect (nth (+ (- (- (length(first board)) 1) y) x) (nth x board)))))
;works!
(defun diag-transform-down-bot (board)
        (loop for y from 0 to (- (length board) 1)
                collect (loop for x from 0 to y
                        collect (nth x (nth (+ (-(-(length board) 1)y) x) board)))))

(defun diag-transform-up-top (board)
	(diag-transform-down-top (reverse board)))

(defun diag-transform-up-bot (board)
	(diag-transform-down-bot (reverse board)))			 

(defun x-in-a-row-h(lst to-win cnt plr)
	(if (eq cnt to-win) (return-from x-in-a-row-h plr))
	(if (eq (first lst) plr)
		(x-in-a-row-h (rest lst) to-win (+ 1 cnt) plr)
		(x-in-a-row-h (rest lst) to-win 1 (first lst)))
)
(defun concat-board (board)
	(concatenate 'list board (vert-transform board) (diag-transform-up-top board) 
	(diag-transform-up-bot board) (diag-transform-down-bot board) (diag-transform-down-top board))
)

(defun x-in-a-row(lst to-win)
	(x-in-a-row-h lst to-win 0 nil))

(defun who-won(to-win board)
	(loop for i in (concat-board board) do 
		(if (x-in-a-row i to-win)
		(return-from who-won (x-in-a-row i to-win))))
	)

(defun place-token (player col board)
	(if (not (null board))
  (if (not(null (nth col (first (last board)))))
	  (place-token player col (butlast board) ) (setf (nth col (first (last board))) player))))
