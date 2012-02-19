;; 有理数を既約にまで簡約化する
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

;; 有理数の表現
(define (make-rat n d) (cons n d))
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))


;; 有理数が正なら分子、分母ともに正
;; 有理数が負なら分子だけを負とする
(define (make-rat n d)
  (let ((g (abs (gcd n d))))
     (if (< d 0)
         (cons (/ (- n) g) (/ (- d) g))
         (cons (/ n g) (/ d g)))))

(define (check n d)
  (print-rat (make-rat n d)))

(check 6 9)
;; gosh> 
;; 2/3
(check 6 -9)
;; gosh> 
;; -2/3
(check -6 9)
;; gosh> 
;; -2/3
(check -6 -9)
;; gosh> 
;; 2/3