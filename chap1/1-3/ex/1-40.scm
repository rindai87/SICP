;; 問題1.40

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (cubic a b c)
  (lambda (x)
    (+ (* x x x)
       (* a x x)
       (* b x)
       c)))

;; x^3 - x = 0
;; => x(x^2 -1) = 0
;; => x = 0, 1, -1
(newtons-method (cubic 0 -1 0) 2.0)
;; gosh> 1.0000000000000002

(newtons-method (cubic 0 -1 0) -2.0)
;; gosh> -1.0000000000000002