;; sqrtの実装をそのまま3乗にしただけ。
(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x) x)))

(define (improve guess x)
  (/ (+ (/ x (* guess guess))
	(* 2 guess))
     3))

(define (good-enough? guess x)
  (< (abs (- (* guess guess guess)
	     x))
     0.001))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (cube-root x)
  (cube-root-iter 1.0 x))

;; ３乗根が求められるか確認
(cube-root 8)
(cube-root 27)
(cube-root 64)

;; 当然、大きな値や小さな値は
;; sqrtの時と同様にうまくいかない
(cube-root 0.0000001)
(cube-root 10e55)