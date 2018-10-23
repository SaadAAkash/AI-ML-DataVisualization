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


(defun list_length(Q F n)
	(cond 
		(	Q			;;this is the condition--- if (list is not empty)
			(setq P (car Q))
			(cond
				(	(not (= P n)) ;;if (p!=n)
					
					(setq F (append F (list P)))
					(setq Q (cdr Q) )
					(list_length Q F n)
				)
				(	(= P n)

					(setq Q (cdr Q) )
					(setq O (append F Q )	) 
					(write O)
				)
			)
		)
	)					;; condition ends
)

(setq X (takeinput ()))
(format t "~%Please enter a number to search: ")
(setq R (read))

(format t "~%Removing the 1st Occurence: ")
(list_length X () R)



