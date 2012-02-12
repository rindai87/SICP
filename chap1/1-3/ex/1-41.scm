;; 問題1.41

;; 引数として一引数の手続きをとり、
;; 受け取った手続きを二回作用させる
;; 手続きを返す手続きdoubleの実装

(define (double f)
  (lambda (x) (f (f x))))

(define (inc x) (+ x 1))

((double inc) 1)
;; gosh> 3
;; (double inc)
;; => (lambda (x) (inc (inc x)))

(((double (double double)) inc) 5)
;; gosh> 21

