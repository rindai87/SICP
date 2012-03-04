;; 問題2.11

;; ９つの場合分けは
;; 1. ux > 0, lx > 0 かつ uy > 0, ly > 0
;; 2. ux > 0, lx > 0 かつ uy > 0, ly < 0
;; 3. ux > 0, lx > 0 かつ uy < 0, ly < 0
;; 4. ux > 0, lx < 0 かつ uy > 0, ly > 0
;; 5. ux > 0, lx < 0 かつ uy > 0, ly < 0
;; 6. ux > 0, lx < 0 かつ uy < 0, ly < 0
;; 7. ux < 0, lx < 0 かつ uy > 0, ly > 0
;; 8. ux < 0, lx < 0 かつ uy > 0, ly < 0
;; 9. ux < 0, lx < 0 かつ uy < 0, ly < 0

;; http://csnagoya-sicp.g.hatena.ne.jp/clairvy/20090411/sicp_ex_2_11
;; 2回を超える乗算が必要なのは2の時？

(define (new-mul-interval x y)
  (let ((ux (upper-bound x))
	(lx (lower-bound x))
	(uy (upper-bound y))
	(ly (lower-bound y)))
    (cond [(and (> ux 0) (> lx 0))
	   (cond [(and (> uy 0) (> ly 0))
		  (make-interval (* ux uy)
				 (* lx ly))]
		 [(and (> uy 0) (< ly 0))
		  (make-interval (* ux uy)
				 (* lx ly))]
		 [(and (< uy 0) (< ly 0))
		  (make-interval (* ux ly)
				 (* lx uy))])]
	  [(and (> ux 0) (< lx 0))
	   (cond [(and (> uy 0) (> ly 0))
		  (make-interval (* ux uy)
				 (* lx ly))]
		 [(and (> uy 0) (< ly 0))
		  (make-interval (min (* ux ly) (* lx uy))
				 (max (* lx ly) (* ux uy)))]
		 [(and (< uy 0) (< ly 0))
		  (make-interval (* lx ly)
				 (* ux uy))])]
	  [(and (< ux 0) (< lx 0))
	   (cond [(and (> uy 0) (> ly 0))
		  (make-interval (* lx uy)
				 (* ux ly))]
		 [(and (> uy 0) (< ly 0))
		  (make-interval (* lx ly)
				 (* ux uy))]
		 [(and (< uy 0) (< ly 0))
		  (make-interval (* ux uy)
				 (* lx ly))])])))