(defun winHor (board win)
  (let ((allwin nil))
    (dotimes (row (length board) allwin)
        (dotimes (col ( - (length (first board)) (- win 1)) allwin)
          (let ((start col))
                (if (< (+ start win) (- (length (first board) 1)))
                    (let ((winner (nth col (nth row board))))
                        (dotimes (winCol win winner)
                            (if (eq (nth (+ winCol start) (nth row board)) winner)
                                (setf winner (nth (+ winCol start) (nth row board)))
                                (setf winner nil)
                            )
                        )
                    (if (not (null winner))
                        (setf allwin winner)))))))))

(defun winCol (board win)
    (let ((allwin nil))
        (dotimes (col (length (first board) allwin))
            (dotimes (row ( - (length board) (- win 1)) allwin)
                (let ((start row))
                    (if (< (+ start win) (- (length board) 1))
                        (let ((winner (nth col (nth row board))))
                            (dotimes (winRow win winner)
                                (if (eq (nth col (nth (+ winRow start) board)) winner)
                                    (setf winner (nth col (nth (+ winRow start) board)))
                                    (setf winner nil)
                                )
                            )
                        (if (not (null winner))
                            (setf allwin winner)))))))))

(defun winDiaFor (board win)
    (let ((allwin nil))
        (dotimes (row (- (length board) (- win 1)) allwin)
            (dotimes (col (- (length (first board)) (- win 1)) allwin)
                (let ((startr row))
                    (let ((startc col))
                        (if (and (< (+ startr win) (- (length board) 1))
                                (< (+ startc win) (- (length (first board) 1))))
                            (let ((winner (nth col (nth row board))))
                                (dotimes (winMove win winner)
                                    (if (eq (nth ( + winMove startc) (nth (+ winMove startr) board)) winner)
                                        (setf winner (nth (+ winMove startc) (nth (+ winMove startr) board)))
                                        (setf winner nil)
                                    )
                                )
                            (if (not (null winner))
                                (setf allwin winner))))))))))

(defun winDiaBack (board win)
    (let ((allwin nil))
        (dotimes (row (- (length board) (- win 1)) allwin)
            (dotimes (Col (- (length (first board)) (- win 1)) allwin)
                (let ((startr row))
                    (let ((startc col))
                        (if (and (< (+ startr win) (- (length board) 1))
                                 (> (- startc win) 0))
                            (let ((winner (nth col (nth row board))))
                                (dotimes (winMove win winner)
                                    (if (eq (nth (- startc winMove) (nth (+ startr winMove) board)) winner)
                                        (setf winner (nth (- startc winMove) (nth (+ startr winMove) board)))
                                        (setf winner nil)
                                    )
                                )
                            (if (not (null winner))
                                (setf allwin winner))))))))))
