;; 問題1.35
;; 黄金比φが不動点であることを示した上で、fixed-point手続きで黄金比を求める

;; SICP P21では、黄金比はφ^2 = φ + 1を満たすとある。
;; 変形するとφ = 1 + 1/φとなる。
;; つまりφは変換 x |→ 1 + 1/xの不動点である。


;; 関数の不動点の探索
;; 1.3.3の例を持ってきた
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

;; fixed-pointを用いて黄金比を求める
(fixed-point (lambda (x) (+ 1 (/ 1 x)))
	     1.0)

;; gosh> 1.618033813400125
;; SICP本文ではφ=1.6180となっているので正しいと考えられる