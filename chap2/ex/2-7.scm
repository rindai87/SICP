;; 問題2.7
;; 区間の抽象化の実装

;; 2.1.4で定義した演算
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
		 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
	(p2 (* (lower-bound x) (upper-bound y)))
	(p3 (* (upper-bound x) (lower-bound y)))
	(p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x 
		(make-interval (/ 1.0 (upper-bound y))
			       (/ 1.0 (lower-bound y)))))

;; 区間構成子
(define (make-interval a b) (cons a b))

;; 選択子upper-bound, lower-boundの実装
(define (upper-bound x) (car x))
(define (lower-bound x) (cdr x))


;; 試してみる
(define R1 (make-interval 7.48 6.12))
(define R2 (make-interval 4.735 4.205))

(upper-bound R1)
;; gosh> 7.48
(lower-bound R1)
;; gosh> 6.12

(add-interval R1 R2)
;; gosh> (10.325 . 12.215)
(mul-interval R1 R2)
;; gosh> (25.7346 . 35.41780000000001)
(div-interval R1 R2)
;; gosh> (1.2925026399155226 . 1.7788347205707493)