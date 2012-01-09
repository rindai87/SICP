;; ベキ乗の線形再帰的プロセス
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

;; ベキ乗の線形反復的プロセス
(define (expt b n)
  (expt-iter b n 1))

(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (expt-iter b (- counter 1) (* b product))))

;; ベキ乗の逐次平方の線形再帰的プロセス
(define (fast-expt b n)
  (cond [(= n 0) 1]
	[(even? n) (square (fast-expt b (/ n 2)))]
	[else (* b (fast-expt b (- n 1)))]))

(define (even? n)
  (= (remainder n 2) 0))

(define (square n)
  (* n n))