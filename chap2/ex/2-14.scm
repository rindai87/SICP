;; 問題2.14

;; http://csnagoya-sicp.g.hatena.ne.jp/clairvy/20090412/sicp_ex_2_14

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
		(add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1 )))
    (div-interval one
		  (add-interval (div-interval one r1)
				(div-interval one r2)))))

;; par1とpar2で結果が異なることの確認
(define R1 (make-center-percent 6.8 10))
(define R2 (make-center-percent 4.7 5))
(display R1)
(display R2)
(par1 R1 R2)
;; gosh> (2.201031010873943 . 3.4873689182805854)
(par2 R1 R2)
;; gosh> (2.581558809636278 . 2.97332259363673)

;; 幅が中央値に比べて小さいパーセントの区間を用いて確認
(define R3 (make-center-percent 10 1))
(display R3)
(define R4 (make-center-percent 20 1))
(display R4)

(define div-R3 (div-interval R3 R3))
(center div-R3)
;; gosh> 1.0002000200020003
(percent div-R3)
;; gosh> 1.9998000199979908
;; 誤差が1%から約2%へと増加している

(define div-R3-R4 (div-interval R4 R3))
(center div-R3-R4)
;; gosh> 2.0004000400040005
(percent div-R3-R4)
;; gosh> 1.9998000199979908
;; やはり誤差が増加している

;; 区間同士の乗算及び除算を行うと誤差が
;; 増加していくことが推察できる