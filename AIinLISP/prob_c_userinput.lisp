(defun takeinput(Q)
	(format t "Enter a new Number: ")
	(setq x (read))
	(cond 
		( 
			(= x 0)
			(format t "Input Ended. Your list is: ")
			(write Q)
		)
		(
		(setq Q (append Q (list x)))
		(write Q)
		(format t "~%")
		(takeinput Q)
		)
	)
)
(setq X (takeinput ()))

