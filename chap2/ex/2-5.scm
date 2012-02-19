;; 問題2.5

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

;; carは対で2が割り切れなくなるまで割る回数
(define (car z)
  (define (iter x count)
    (if (> (abs (remainder x 2)) 0)
        count
        (iter (/ x 2) (+ count 1))))
  (iter z 0))

;; cdrは対で割り切れなくなるまで割る回数
(define (cdr z)
  (define (iter x count)
    (if (> (abs (remainder x 3)) 0)
        count
        (iter (/ x 3) (+ count 1))))
  (iter z 0))

;; やってること自体は同じなので更に抽象化できる
(define (pair z n)
  (define (iter x count)
    (if (> (abs (remainder x n)) 0)
        count
        (iter (/ x n) (+ count 1))))
  (iter z 0))

(define (car z)
  (pair z 2))

(define (cdr z)
  (pair z 3))

(cons 6 10)
;; gosh> 3779136
(car (cons 6 10))
;; gosh> 6
(cdr (cons 6 10))
;; gosh> 10