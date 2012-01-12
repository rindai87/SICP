;; 問題1.30
;; 手続きsumの反復化

;; 反復のsum
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (+ result (term a)))))
    (iter a 0))

(define (sum-integers a b)
  (define (identity x) x)
  (define (inc x) (+ x 1))
  (sum identity a inc b))

(sum-integers 1 10)
;; gosh> 55


;; 比較のために再帰のsum
(define (recursion-sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (recursion-sum term (next a) next b))))

(define (recursion-sum-integers a b)
  (define (identity x) x)
  (define (inc x) (+ x 1))
  (recursion-sum identity a inc b))

(recursion-sum-integers 1 10)
;; gosh> 55