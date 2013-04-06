;this is still in progress. 
(defun main (rows cols)
	(main-h (make-board rows cols)'0)
)
	
(defun main-h (board player)
	(print-matrix board)
	(format t "Player ~D, make a move:" player)
	(if (wins(place-tok board (read) player))
	(do-win)
	(main-h board (% (+ player 1) 1))))