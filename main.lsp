;this is still in progress. 	
(defun main-h (board player)
	(format t "Player ~D, make a move:" player)
	(place-token player (read) board )
	(print-matrix board)	
	(if (who-won '4 board ) 
		(format t "Player ~D is the victor!" player)
	(main-h board (mod (+ player 1) 2))))

(defun main (rows cols)
    (main-h (make-board rows cols) '0)
)
