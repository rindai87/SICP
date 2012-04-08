;; 問題2.42

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
	(list empty-board)
	(filter
	 (lambda (positions) (safe? k positions))
	 (flatmap
	  (lambda (rest-of-queens)
	    (map (lambda (new-row)
		   (adjoin-position new-row k rest-of-queens))
		 (enumerate-interval 1 board-size)))
	  (queen-cols (- k 1))))))
  (queen-cols board-size))


(define empty-board '())

(define (adjoin-position new-row k rest-of-queens)
  (append (list new-row) rest-of-queens))

(define (safe? k positions)
  (define (safe-rest? k new-row i positions)
    (if (null? positions)
        #t
        (let ((next-row (car positions)))
          (and (not (= next-row new-row))
               (not (= next-row (+ new-row i)))
               (not (= next-row (- new-row i)))
               (safe-rest? k new-row (+ i 1) (cdr positions))))))
    (safe-rest? k (car positions) 1 (cdr positions)))

(define (print-queens queens)
  (map reverse queens))


(print-queens (queens 8))
