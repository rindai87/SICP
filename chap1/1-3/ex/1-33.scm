;; 問題1.33

;; filtered-accumulate手続きの実装
(define (filtered-accumulate filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (if (filter a)
	  (combiner (term a)
		    (filtered-accumulate filter combiner null-value term (next a) next b))
	  (filtered-accumulate filter combiner null-value term (next a) next b))))

;; ついでに反復でも実装
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (filtered-accumulate filter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(if (filter a)
	    (iter (next a) (combiner result (term a)))
	    (iter (next a) result))))
  (iter a null-value))

;; 素数を判定するprime?の実装
(define (prime? n)
  (if (= n 1)
      #f
      (= n (smallest-divisor n))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond [(> (square test-divisor) n) n]
	[(divides? test-divisor n) test-divisor]
	[else (find-divisor n (+ test-divisor 1))]))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square n)
  (* n n))

(define (identity n) n)
(define (inc n) (+ 1))


;; a. 区間a, bの素数の二乗の和
(define (sum-of-prime a b)
  (filtered-accumulate prime? + 0 identity a inc b))

(sum-of-prime 1 10)
;; gosh> 17
;; 2 + 3 + 5 + 7 = 17


;; b. nと互いに素で、nより小さい正の整数の積
(define (product-of-gcd n)
  (define (gcd a b)
    (if (= b 0)
	a
	(gcd b (remainder a b))))
  (define (gcd-filter x)
    (= (gcd n x) 1))

  (filtered-accumulate gcd-filter * 1 identity 1 inc n))

(product-of-gcd 5)
;;gosh> 24
;; 2 * 3 * 4
(product-of-gcd 6)
;;gosh> 5
;; 6より小さくて6と互いに素な整数は5のみ
(product-of-gcd 7)
;;gosh> 720
;; 2 * 3 * 4 * 5 * 6 = 720