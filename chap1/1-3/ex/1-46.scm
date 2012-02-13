;; 問題1.46

(define (iterative-improve good-enough? improve)
  (define (check guess)
    (let ((next-guess (improve guess)))
      (if (good-enough? guess next-guess)
          next-guess
          (check next-guess))))
  (lambda (initial-guess)
    (check initial-guess)))

(define (average x y)
  (/ (+ x y) 2))
 
(define (square x) (* x x))
 
;; sqrtの手続き
(define (sqrt x)
  (define (good-enough? guess next-guess)
    (< (abs (- (square next-guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) x))

(sqrt 9.0)
;; gosh> 3.00009155413138



;; fixed-pointの手続き
(define tolerance 0.00001)
 
(define (fixed-point f first-guess)
  (define (close-enough? guess next-guess)
    (< (abs (- guess next-guess)) tolerance))
  (define (improve guess)
    (f guess))
  ((iterative-improve close-enough? improve) first-guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))
 
(define (fixed-point-sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

(fixed-point-sqrt 9.0)
;; gosh> 3.0