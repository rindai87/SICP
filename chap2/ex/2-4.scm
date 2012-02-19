;; 問題2.4

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(car (cons 1 2))
;; gosh> 1
(cdr (cons 1 2))
;; gosh> 2

;; (car (cons 1 2))
;; => (car (lambda (m) 1 2))
;; => ((lambda (m) 1 2) (lambda (p q) q))
;; cons手続きで値が２つ渡されており、1つの引数をとるlambdaを返す
;; carおよび、cdr手続きは、引数にとった手続きに対して、
;; ２つの引数のうちに最初(or 後)の引数を返す手続きを渡す

