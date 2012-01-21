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