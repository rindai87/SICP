;; 問題2.30

(define (square-tree tree)
  (define nil '())
  (cond [(null? tree) nil]
	[(not (pair? tree)) (* tree tree)]
	[else (cons (square-tree (car tree))
		    (square-tree (cdr tree)))]))

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
;; gosh> (1 (4 (9 16) 25) (36 49))



;; mapを利用したもの
(define (square-tree tree)
  (map (lambda (sub-tree)
	 (if (pair? sub-tree)
	     (square-tree sub-tree)
	     (* sub-tree sub-tree)))
       tree))

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
;; gosh> (1 (4 (9 16) 25) (36 49))