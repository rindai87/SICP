;; 問題2.12

;; 区間構成子
(define (make-interval a b) (cons a b))

;; 選択子upper-bound, lower-boundの実装
(define (upper-bound x) (cdr x))
(define (lower-bound x) (car x))

;; 中央値と許容誤差で表す数を扱う構成子と選択子
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))


;; 中央値とパーセント許容誤差をとり、区間を返す構成子
(define (make-center-percent c p)
  (let ((per (/ p 100.0)))
    (make-interval (- c (* c per))
		   (+ c (* c per)))))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (percent i)
  (let ((width (/ (- (upper-bound i) (lower-bound i)) 2)))
    (* (/ width (center i)) 100)))

;; 10パーセントの許容誤差で6.8オーム(教科書P52)
(define R1 (make-center-percent 6.8 10))
(display R1)
;; gosh> (6.12 . 7.479999999)
(center R1)
;; gosh> 6.8
(percent R1)
;; gosh> 9.999999999999996
;; なんか微妙に誤差が・・・