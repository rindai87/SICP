;; 問題2.28

(define x (list (list 1 2) (list 3 4)))

;; count-leavesを流用する
(define (fringe items)
  (cond [(null? items) items]
	[(not (pair? items)) (list items)]
	[else (append (fringe (car items))
		      (fringe (cdr items)))]))

(fringe x)
;; gosh> (1 2 3 4)


(fringe (list (list 1 2) (list (list 3 4) 5 (list 6 7)) (list 8 9)))
;; gosh> (1 2 3 4 5 6 7 8 9)