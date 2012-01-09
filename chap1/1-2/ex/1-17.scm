;; 問題1.17
;; bが0なら0を返す
;; bが偶数なら結果を２倍させつつ、bを半分にしてfast-multiを再度呼び出し
;; bが奇数なら結果にaを足して、bを1減らしてfast-multiを再度呼び出し
(define (fast-multi a b)
  (cond [(= b 0) 0]
	[(even? b) (double (fast-multi a (halve b)))]
	[else (+ a (fast-multi a (- b 1)))]))

(define (double n)
  (* n 2))

(define (halve n)
  (/ n 2))