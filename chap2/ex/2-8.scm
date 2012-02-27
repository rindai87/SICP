;; 問題2.8
;; 二つの区間の差の計算

;; x > yとした時
;; x-yのupper-bound : xのupper-bound - yのlower-bound
;; x-yのlower-bound : xのlower-bound - yのupper-bound
(define (sub-interval x y)
  (make-interval (- (upper-bound x) (lower-bound y))
		 (- (lower-bound x) (upper-bound y))))

(define R1 (make-interval 7.48 6.12))
(define R2 (make-interval 4.735 4.205))

(sub-interval R1 R2)
;; gosh> (3.2750000000000004 . 1.3849999999999998)
