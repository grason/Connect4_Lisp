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

;this has to be a scoping error i swear. I rewrote the entire thing, and there isn't a way this shouldn't be working unless its not passing the variables correctly between the parts. If you know how to make variables global, then we could fix this quickly

(defun winHor (board win)
  (let ((allwin nil))
    (dotimes (row (length board) allwin)
        (dotimes (col ( - (length (first board)) (- win 1)) allwin)
          (let ((start col))
                (if (< (+ start win) (- (length (first board)) 1))
                    (let ((winner (nth col (nth row board))))
                        (dotimes (winCol win winner)
                            (if (eq (nth (+ winCol start) (nth row board)) winner)
                                (setf winner (nth (+ winCol start) (nth row board)))
                                (setf winner nil)
                            )
                        )
                    (if (not (null winner))
                        (setf allwin winner)))))))))


(defun vert-transform (board) 
    (loop for y from 0 to (- (length (first board)) 1)
	collect (loop for x from 0 to (- (length board) 1)
	collect (nth y (nth x board)))))

(defun rating(x y inc)
	(cond
		((< inc 0) (+ x y))
		((> inc 0) (- y x))))

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
	(diag-transform-down-top (reverse board)))			 

(defun x-in-a-row-h(lst to-win cnt plr)
	(if (eq cnt to-win) (return-from x-in-a-row-h plr))
	(if (eq (first lst) plr)
		(x-in-a-row-h (rest lst) to-win (+ 1 cnt) plr)
		(x-in-a-row-h (rest lst) to-win 1 (first lst)))
)
(defun x-in-a-row(lst to-win)
	(x-in-a-row lst to-win 0 -1 ))
	
(defun who-won (win board)
	(let ((winner nil))
	(if (winDiaBack board win)
		(setf winner (winDiaBack board win)))
	(if	(winDiaFor board win)
		(setf winner (winDiaFor board win)))
	(if	(winHor board win)
		(setf winner (winHor board win)))
	(if (winCol board win)
		(setf winner (winCol board win)))))
		
(defun place-token (player col board)
	(if (not (null board))
  (if (not(null (nth col (first (last board)))))
	  (place-token player col (butlast board) ) (setf (nth col (first (last board))) player))))
