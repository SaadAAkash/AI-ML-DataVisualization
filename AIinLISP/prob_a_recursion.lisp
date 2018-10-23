;; prob 1 tail recursion

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

(list_length (list 1 2 3 4 5 6 8 10 12 13 14 15) 0)

