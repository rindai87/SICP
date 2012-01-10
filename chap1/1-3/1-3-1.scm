;; aからbまでの整数の和
(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))))

(sum-integers 1 10)

;; 与えられた範囲の整数の三乗の和
(define (sum-cubes a b)
  (define (cube x)
    (* x x x))
  (if (> a b)
      0
      (+ (cube a) (sum-cubes (+ a 1) b))))

(sum-cubes 1 2)
;; 1*1*1 + 2*2*2 = 9

;; 級数の項の並びの和
;; 1/(1*3) + 1/(5*7) + 1/(9*11) + ...
(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b))))

(pi-sum 1 7)
;; 1/3 + 1/35


;; 抽象化
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

;; 高階手続きを利用したsum-cubesの実装
(define (sum-cubes a b)
  (define (cube x)
    (* x x x))
  (define (inc n)
    (+ n 1))
  (sum cube a inc b))

(sum-cubes 1 10)
;; gosh> 3025


;; 高階手続きを利用したsum-integersの実装
(define (sum-integers a b)
  (define (identity x) x)
  (define (inc n)
    (+ n 1))
  (sum identity a inc b))

(sum-integers 1 10)
;; gosh> 55


;; 航海手続きを利用したpi-sum
(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

(pi-sum 1 7)


;; a,b間の関数fの定積分
(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (cube x)
  (* x x x))

(integral cube 0 1 0.01)

(integral cube 0 1 0.001)