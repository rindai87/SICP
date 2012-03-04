;; 問題2.10

;; 0をまたがる区間で割った時、どうなるか分からないことを調べる
(define R1 (make-interval 5 10))
(define R2 (make-interval 1 5))
(define R3 (make-interval -10 -5))
(define R4 (make-interval -5 10))

(div-interval R1 R2)
;; gosh> (1.0 . 10.0)
;; 期待通り

(div-interval R1 R3)
;; gosh> (-2.0 . -0.5)
;; 期待通り

(div-interval R1 R4)
;; gosh> (-2.0 . 1.0)
;; 期待通りではない
;; ほんとは(-1, 1)になってほしい

;; div-intervalはmul-intervalを利用していて
;; mul-intervalで全ての区間の組み合わせで
;; 乗算を行ったあと、大小関係を判定しているため


(define (new-div-interval x y)
  (let ((ly (lower-bound y))
	(uy (upper-bound y)))
    (if (< (* ly uy) 0)
	(error "error")
	(mul-interval x
		      (make-interval (/ 1.0 ly)
				     (/ 1.0 uy))))))

(new-div-interval R1 R2)
;; gosh> (1.0 . 10.0)
(new-div-interval R1 R3)
;; gosh> (-2.0 . -0.5)
(new-div-interval R1 R4)
;; gosh> *** ERROR: error
;; Stack Trace:
;; _______________________________________