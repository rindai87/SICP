;; 1.3.4 値として返される手続き

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

((average-damp square) 10)

;; 1.3.3 で定義したfixed-pointを持ってくる
(define tolerance 0.000001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
	       1.0))

(sqrt 4.0)
;; gosh> 2.000000000000002


;; 立方根を得る手続き
(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
	       1.0))

(cube-root 8.0)
;; gosh> 2.0000002271906077



;; Newton法
(define dx 0.00001)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (cube x) (* x x x))

((deriv cube) 5)
;; gosh> 75.00014999664018

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

;; Newton方でsqrt
(define (sqrt x)
  (newtons-method (lambda (y) (- (square y) x))
		  1.0))

(sqrt 4.0)
;; gosh> 2.0000000000002385


;; 抽象と第一級手続き
(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (sqrt x)
  (fixed-point-of-transform (lambda (y) (/ x y))
			    average-transform
			    1.0))

(define (sqrt x)
  (fixed-point-of-transform (lambda (y) (- (square y) x))
			    newton-transform
			    1.0))