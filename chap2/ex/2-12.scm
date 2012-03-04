;; 問題2.12

;; 中央値と許容誤差で表す数を扱う構成子と選択子
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))


;; 中央値とパーセント許容誤差をとり、区間を返す構成子
(define (make-center-percent c p)
  (let ((percent (/ p 100.0)))
    (make-interval (+ c (* c percent))
		   (- c (* c percent)))))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (percent i)
  (let ((width (/ (- (upper-bound i) (lower-bound i)) 2)))
    (* (/ width (center i)) 100)))

;; 10パーセントの許容誤差で6.8オーム(教科書P52)
(define R1 (make-center-percent 6.8 10))
;; gosh> (7.4799999999999995 . 6.12)
(center R1)
;; gosh> 6.8
(percent R1)
;; gosh> 9.999999999999996
;; なんか微妙に誤差が・・・