;this is still in progress. 	
(defun main-h (board player)
	(print-matrix board)
	(format t "Player ~D, make a move:" player)
	(place-token player (read) board )
	(if (/= (who-won board '4) nil)
		(setq winner (who-won board 4)
		(format t "Player ~d, you Win:" player))
		(main-h board (% (+ player 1) 1))))

(defun main (rows cols)
    (main-h (make-board rows cols) '0)
)
