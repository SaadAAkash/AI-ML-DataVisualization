;; prob 1 tail recursion

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


(format t "Max: ")
(list_max (list 1 2 3 4 5 6 8 10 12 13 14 1) 0)
(format t "~%Min: ")
(list_min (list 1 2 3 4 5 0 8 10 12 13 14 1) 200)

