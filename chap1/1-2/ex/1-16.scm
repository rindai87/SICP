;; 問題1.16
;; 逐次平方による反復的ベキ乗プロセスの手続き

(define (fast-expt b n)
  (fast-expt-iter 1 b n))

(define (fast-expt-iter a b n)
  (cond [(= n 0) a]
	[(even? n) (fast-expt-iter a (square b) (/ n 2))]
	[else (fast-expt-iter (* b a) b (- n 1))]))

(define (even? n)
  (= (remainder n 2) 0))

(define (square n)
  (* n n))
