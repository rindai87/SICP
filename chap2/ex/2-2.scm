;; 問題2.2
;; 平面上のの線分を表現する
;; 線分は：始発点と終着点で表現されている

;; 線を表現する
(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (cdr seg))

;; 点を表現する
(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

;; 引数として線分をとり、中間点を返す手続き
(define (midpoint-segment seg)
  (let ((start (start-segment seg))
	(end (end-segment seg)))
    (print-point (make-point (/ (+ (x-point start) (x-point end)) 2.0)
		       (/ (+ (y-point start) (y-point end)) 2.0)))))

(midpoint-segment (make-segment (make-point 1 2)
				(make-point 3 5)))
;; gosh> 
;; (2.0,3.5)

;; 点を出力する手続き
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(make-segment (make-point 2 5) (make-point 3 10))