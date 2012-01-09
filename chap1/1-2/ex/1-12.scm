;; Pascal三角形
;; 上からn段目、左からk個目の要素を求める

(define (pascal n k)
  (cond [(= n 1) 1] ;; 一番上
	[(= k 1) 1] ;; 左端
	[(= n k) 1] ;; 右端(各段の個数は段数に等しい)
	[(< n k) (print "your input is not invalid")]
	[else (+ (pascal (- n 1) (- k 1))
		 (pascal (- n 1) k))]))