;; 木構造再帰(tree recursion)
;; 例としてFibonacci数
(define (fib n)
  (cond [(= n 0) 0]
	[(= n 1) 1]
	[else (+ (fib (- n 1))
		 (fib (- n 2)))]))

(fib 5)

;; 反復的なFibonacci数
(define (fib n)
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))


;; 両替の例
;; 5つの種類の硬貨がある場合、
;; 与えられた金額を満たす両替のパターンが
;; いくつあるか、という問題
;; 木構造の枝までいくと
;; ・うまく両替できた時：1
;; ・両替できなかった時(合計を越えるor硬貨の種類が足りなくなる)：0
;; (define (cc amount kinds-of-conins))
;; のcondのelse節の実装がポイント
;; 左の枝、より大きな硬貨を使うパターンを構築
;; 右の枝、合計金額から現在の硬貨分の額を減らす
(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond [(= amount 0) 1]
	[(or (< amount 0) (= kinds-of-coins 0)) 0]
	[else (+ (cc amount
		     (- kinds-of-coins 1))
		 (cc (- amount
			(first-denomination kinds-of-coins))
		     kinds-of-coins))]))

(define (first-denomination kinds-of-coins)
  (cond [(= kinds-of-coins 1) 1]
	[(= kinds-of-coins 2) 5]
	[(= kinds-of-coins 3) 10]
	[(= kinds-of-coins 4) 25]
	[(= kinds-of-coins 5) 50]))

(count-change 100)