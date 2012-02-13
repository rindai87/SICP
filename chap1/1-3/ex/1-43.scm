;; 問題1.43

;; fをn回作用させる手続き

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter i g)
    (if (= i n)
	g
        (iter (+ i 1) (compose f g))))
  (iter 1 f))

(define (square x) (* x x))
(define (inc x) (+ x 1))

((repeated square 2) 5)
;; gosh> 625

((repeated inc 10) 5)
;; gosh> 15