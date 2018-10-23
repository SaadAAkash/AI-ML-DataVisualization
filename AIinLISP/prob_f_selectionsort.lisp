(defun takeinput(Q)
	(format t "Enter a new Number: ")
	(setq x (read))
	(cond 
		( 
			(= x 0)
			(format t "Input Ended. Your list is: ")
			(write Q)(format t "~%")
			(return-from takeinput Q)
;;(format t "~%")
		)
		(
		(setq Q (append Q (list x)))
		(write Q)
		(format t "~%")
		(takeinput Q)
		)
	)
)


(defun list_min(Q P)
	(cond 
		(	Q			
			(setq m (car Q))
			(if (< m P)
				(setq P m)
			)
			(setq Q (cdr Q))
			(list_min Q P)
		)
		(
			(setq Z P)
			(return-from list_min  Z)
		)			
	)					
)

(defun list_max(Q P)
	(cond 
		(	Q			
			(setq m (car Q))
			(if (> m P)
				(setq P m)
			)
			(setq Q (cdr Q))
			(list_max Q P)
		)
		(
			(setq Z P)
			(return-from list_max  Z)
		)			
	)					
)


(defun list_occur(Q F n m)

	(cond 
		(	Q			
			(setq P (car Q))
			(cond
				(	(not (= P n)) ;;if (p!=n)

					(setq F (append F (list P)))
					(setq Q (cdr Q) )
					(list_occur Q F n m)
				)
				(	(= P n)

					(setq Q (cdr Q) )
					(setq F (append F (list m)))
					(setq O (append F Q )	) 
					(setq O (cdr O) )

					

					(return-from list_occur O)
				)
			)
		)
	)					
)


(defun list_sort_asc(Q F)

	(cond 
		(	Q	
			
			(setq P (car Q))					
			(setq M (list_min Q P))
			
			(setq F (append F (list M)))

			(format t "~% unsorted = ")(write Q)
			(format t "~% sorted = ")(write F)
			
			(setq Q (list_occur Q () M P ))
			(setq F (append (list_sort_asc Q F) ) )

			

		)
	)
	(return-from list_sort_asc F)					
)


(defun list_sort_des(Q F)

	(cond 
		(	Q	
			
			(setq P (car Q))					
			(setq M (list_max Q P))
			
			(setq F (append F (list M)))

			(format t "~% unsorted = ")(write Q)
			(format t "~% sorted = ")(write F)
			
			(setq Q (list_occur Q () M P ))
			(setq F (append (list_sort_des Q F) ) )

			

		)
	)
	(return-from list_sort_des F)					
)

(setq X (takeinput ()))
(setq Y X)

(setq R (list_sort_asc X ()))
(format t "~% After Sorting in Ascending order: ")
(write R)
(format t "~% ~% ~% ")

(setq R (list_sort_des Y ()))
(format t "~% ~% ~% ~% After Sorting in Descending order: ")
(write R)
