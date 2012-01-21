;; 問題1.32

;; a. 再帰の場合のaccumulate
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
		(accumulate combiner null-value term (next a) next b))))1

(define (identity x) x)
(define (inc x) (+ x 1))

(accumulate * 1 identity 1 inc 5)
;; gosh> 120
;; 1 * 2 * 3 * 4 * 5 = 120
(accumulate + 0 identity 1 inc 10)
;; gosh> 55
;; 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 = 55



;; b. 反復の場合のaccumulate
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (combiner result (term a)))))
  (iter a null-value))

(accumulate * 1 identity 1 inc 5)
;; gosh> 120
;; 1 * 2 * 3 * 4 * 5 = 120
(accumulate + 0 identity 1 inc 10)
;; gosh> 55
;; 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 = 55
