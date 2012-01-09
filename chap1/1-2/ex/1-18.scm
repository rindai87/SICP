;; 問題1.18
;; 問題1.17で実装した対数的ステップ数の乗算を反復的プロセスで実装
(define (fast-multi a b)
  (fast-multi-iter a b 0))

(define (fast-multi-iter a b n)
  (cond [(= b 0) n]
	[(even? b) (fast-multi-iter (double a) (halve b) n)]
	[else (fast-multi-iter a (- b 1) (+ a n))]))

(define (double n)
  (* n 2))

(define (halve n)
  (/ n 2))