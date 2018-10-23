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

(defun list_length(Q n)
	(cond 
		(	Q			;;this is the condition--- if (list is not empty)
			(setq n (+ n 1))
			(setq Q (cdr Q))
			(list_length Q n)
		)
		((write n))			;; else section
	)					;; condition ends
)

(defun list_max(Q n)
	(cond 
		(	Q			;;this is the condition--- if (list is not empty)
			(setq m (car Q))
			(if (> m n)
				(setq n m)
			)
			(setq Q (cdr Q))
			(list_max Q n)
		)
		((write n))			;; else section
	)					;; condition ends
)

(defun list_min(Q n)
	(cond 
		(	Q			;;this is the condition--- if (list is not empty)
			(setq m (car Q))
			(if (< m n)
				(setq n m)
			)
			(setq Q (cdr Q))
			(list_min Q n)
		)
		((write n))			;; else section
	)					;; condition ends
)

(setq X (takeinput ()))

(format t "~%Length of the list is: ")
(list_length X 0)

(format t "~%Max value in the list: ")
(list_max X 0)

(format t "~%Min value in the list: ")
(list_min X 200)


