;this is still in progress. 
(defun main (rows cols)
	(main-h (make-board rows cols)'0)
)
	
(defun main-h (board player)
	(print-matrix board)
	(format t "Player ~D, make a move:" player)
	(place-tok board (read) player)
	(if (/= (winCheck board 4) nil)
		(setq winner (winCheck board 4)
		(format t "Player ~d, you Win:" player))
		(main-h board (% (+ player 1) 1)))))