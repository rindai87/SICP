;; 有理数の計算の手続き

;; 有理数の足し算
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
	       (* (numer y) (denom x)))
	    (* (denom x) (denom y))))

;; 有理数の引き算
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
	       (* (numer y) (denom x)))
	    (* (denom x) (denom y))))

;; 有理数の掛け算
(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
	    (* (denom x) (denom y))))

;; 有理数の割り算
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
	    (* (denom x) (numer y))))

;; 有理数の等価性テスト
(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))


;; 対の話
(define x (cons 1 2))

(car x)
;;gosh> 1

(cdr x)
;;gosh> 2

(define y (cons 3 4))
(define z (cons x y))

(car (car z))
;; gosh> 1

(car (cdr z))
;; gosh> 3


;; 有理数の表現
(define (make-rat n d) (cons n d))
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define one-half (make-rat 1 2))
(print-rat one-half)
;; gosh> 
;; 1/2

(define one-third (make-rat 1 3))
(print-rat one-third)
;; gosh> 
;; 1/3

(print-rat (add-rat one-half one-third))
;; gosh> 
;; 5/6

(print-rat (mul-rat one-half one-third))
;; gosh> 
;; 1/6

(print-rat (add-rat one-third one-third))
;; gosh>
;; 6/9

;; 有理数を既約にまで簡約化する
(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(print-rat (add-rat one-third one-third))
;; gosh>
;; 2/3



;; 2.1.2 抽象の壁

;; 有理数の簡約化を、
;; 有理数を構成する時ではなく、
;; その部分を取り出す時に行う場合
(define (make-rat n d)
  (cons n d))

(define (numer x)
  (let ((g (gcd (car x) (cdr x))))
    (/ (car x) g)))

(define (denom x)
  (let ((g (gcd (car x) (cdr x))))
    (/ (cdr x) g)))