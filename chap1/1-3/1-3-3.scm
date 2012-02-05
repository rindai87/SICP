;; 1.3.3 一般的方法としての手続き

(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
	midpoint
	(let ((test-value (f midpoint)))
	  (cond [(positive? test-value)
		 (search f neg-point midpoint)]
		[(negative? test-value)
		 (search f midpoint pos-point)]
		[else midpoint])))))

(define (average x y)
  (/ (+ x y) 2))

(define (close-enough? x y)
  (< (abs (- x y)) 0.001))

(define (half-interval-method f a b)
  (let ((a-value (f a))
	(b-value (f b)))
    (cond [(and (negative? a-value) (positive? b-value))
	   (search f a b)]
	  [(and (negative? b-value) (positive? a-value))
	   (search f b a)]
	  [else
	   (error "Values are not of opposite sign" a b)])))

(half-interval-method sin 2.0 4.0)
;; gosh> 3.14111328125

(half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3))
		      1.0
		      2.0)
;; gosh> 1.89306640625


;; 上の例では直感的にわかりにくいので
;; x^2 - 4 = (x+2)(x-2) = 0 の場合で考えてみる

;; 解の一つ2.0の求める例
(half-interval-method (lambda (x) (- (* x x) 4))
		      1.0
		      3.0)
;; gosh> 2.0

;; 解の一つ-2.0を求める例
(half-interval-method (lambda (x) (- (* x x) 4))
		      -3.0
		      -1.0)
;; gosh> -2.0

;; 与えられた２点で同じ符号を持ち、探索が不可能な場合
(half-interval-method (lambda (x) (- (* x x) 4))
		      -1.0
		      1.0)
;; gosh> *** ERROR: Values are not of opposite sign -1.0 1.0


;; 関数の不動点の探索
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

(fixed-point cos 1.0)
;; gosh> 0.7390855263619245

(fixed-point (lambda (y) (+ (sin y) (cos y)))
	     1.0)
;; gosh> 1.2587277968014188


;; 不動点の探索
(define (sqrt-from-fixed-point x)
  (fixed-point (lambda (y) (/ x y))
	       1.0))

;; これは収束しない
(sqrt-from-fixed-point 4.0)
;; 以下のような感じで振動してしまうから
;; 1.0
;; 4.0
;; 1.0
;; 4.0
;; 1.0
;; 4.0
;; 1.0
;; 4.0
;; 1.0
;; 4.0
;; 1.0
;; 4.0
;; ....

;; 予測値の大きな変化を防ぐことで対応
;; 平均緩和法(average damping)と言う
(define (sqrt-from-fixed-point2 x)
  (fixed-point (lambda (y) (average y (/ x y)))
	       1.0))

(sqrt-from-fixed-point2 4.0)
;; gosh> 1.0
;; 2.5
;; 2.05
;; 2.000609756097561
;; 2.0000000929222947
;; 2.000000000000002