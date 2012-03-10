;; 問題2.19

(define us-coins (list 50 25 10 5 1))

(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (cc amount coin-values)
  (cond [(= amount 0) 1]
	[(or (< amount 0) (no-more? coin-values)) 0]
	[else
	 (+ (cc amount
		(except-first-denomination coin-values))
	    (cc (- amount
		   (first-denomination coin-values))
		coin-values))]))

;; コインのリストの先頭を返す
(define (first-denomination coin-values)
  (car coin-values))

;; コインのリストの先頭意外を返す
(define (except-first-denomination coin-values)
  (cdr coin-values))

;; コインのリストに残りがあるか
(define (no-more? coin-values)
  (null? coin-values))

(cc 100 us-coins)
;; gosh> 292


;; アルゴリズム上重要なのはコインの種類であり
;; コインの順序ではない
(define us-coins2 (list 5 25 10 1 50))
(cc 100 us-coins2)
;; gosh> 292