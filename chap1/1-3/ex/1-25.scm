;; 問題1.25

;; オリジナルのexpmod(p28)
;; baseのexp乗の、mの剰余を求める処理
(define (expmod base exp m)
  (define (square x)
    (* x x))
  (cond [(= exp 0) 1]
	[(even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m)]
	[else
	 (remainder (* base (expmod base (- exp 1) m))
		    m)]))

;; fast-expr
;; bのn乗を求める処理
(define (fast-expt b n)
  (define (square x)
    (* x x))
  (cond [(= 0 n) 1]
	[(even? n) (square (fast-expt b (/ n 2)))]
	[else (* b (fast-expt b (- n 1)))]))

(fast-expt 2 10)
;; gosh> 1024


;; Alysa P. Hackerのexpmod
(define (expmod base exp m)
  (remainder (fast-expt base exp) m)) ;; suquareしてからremainder

(expmod 2 3 3)


;; 計算結果という意味では同一の結果が得られる。
;; オリジナルのexpmodは繰り返し毎にbaseの剰余を求めて、
;; 値があまり大きくならないようにしている。
;; Alyssaのexpmodでは一度に累乗を求めてからbaseの剰余を求めているので
;; remainderに時間がかかっている。

;; どこかがボトルネックになっているのか?
;; gosh> (fast-expt 10 10000)
;; gosh> (fast-expt 10 1000)
;; とすると、圧倒的に(fast-expt 10 10000)の方が遅い
;; またgosh> (fast-expt 100 10000)は体感的に(fast-expt 10 10000)と
;; ほぼ同じと考えられる
;; このことから高速テストにおいてボトルネックになるのは、除算ではなく
;; 大きな数の乗算の処理に時間がかかっていると推測できる