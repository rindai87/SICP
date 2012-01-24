;; 問題1-31

;; a. 与えられた範囲の点での関数値の積を返すproductを用いたfactorial
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
	 (product term (next a) next b))))

(define (factorial n)
  (define (inc x) (+ x 1))
  (define (identity x) x)
  (product identity 1 inc n))

(factorial 6)
;;gosh> product
;;gosh> 720

;; 普通のfactorial
(define (normal-factorial n)
  (if (= n 1)
      1
      (* n (normal-factorial (- n 1)))))

(normal-factorial 6)
;;gosh> product
;;gosh> 720

;; John Wallisの式
(define (wallis n)
  (define (square x) (* x x))
  (define (next x) (+ x 1))
  (define (term x)
    (/ (* (* x 2) (* (+ x 1) 2))
       (square (+ (* x 2) 1))))
  (product term 1.0 next n))

(wallis 100)
;;gosh> 0.7873446182921502
(wallis 1000)
;;gosh> 0.7855943412734705
(wallis 10000)
;;gosh> 0.7854177966336237
(wallis 100000)
;;gosh> 0.7854001268753947

(use math.const)
(/ pi 4)
;;0.7853981633974483



;; b. aで再帰的プロセスを書いたので反復的プロセスで書く
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (* a result))))
  (iter a 1))
    