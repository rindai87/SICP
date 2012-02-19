;; 問題2.3
; 平面上の長方形の表現を実装する

;; 長方形を表現する
(define (make-rectangle upper-left-point lower-right-point)
  (cons upper-left-point lower-right-point))

(define (upper-left-point rec)
  (car rec))

(define (lower-right-point rec)
  (cdr rec))

(define (calc-width rec)
  (abs (- (x-point (lower-right-point rec))
	  (x-point (upper-left-point rec)))))

(define (calc-height rec)
  (abs (- (y-point (upper-left-point rec))
	  (y-point (lower-right-point rec)))))

;; 長方形の周囲の長さ
(define (calc-perimeter rec)
  (+ (* 2 (calc-width rec))
     (* 2 (calc-height rec))))

(calc-perimeter (make-rectangle (make-point 5 10) (make-point 10 5)))
;; gosh> 20

;; 長方形の面積
(define (calc-area rec)
  (* (calc-width rec) (calc-height rec)))

(calc-area (make-rectangle (make-point 5 10) (make-point 10 5)))
;; gosh> 25

;; 点を表現する
(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))