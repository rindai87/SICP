;; 問題1.42

;; 一引数の関数fとgを用いて
;; gの後のfの合成関数を定義する

(define (compose f g)
  (lambda (x) (f (g x))))

(define (inc x) (+ x 1))

(define (square x) (* x x))

((compose square inc) 6)
;; (* (+ 6 1) (+ 6 1))
;; gosh> 49