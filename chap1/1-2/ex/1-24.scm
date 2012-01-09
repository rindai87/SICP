;; 問題1.24
(define (search-for-primes start end)
  (define (timed-search-for-primes n start-time cnt)
    (cond [(or (> n end) (= cnt 3)) #t]
	  [(even? n) (timed-search-for-primes (+ n 1) (current-time) cnt)]
	  [(fast-prime? n 1)
	   (begin (display n)
		  (report-time (time-difference (current-time) start-time))
		  (timed-search-for-primes (+ n 2) (current-time) (+ cnt 1)))]
	  [else (begin (display n)
		       (newline)
		       (timed-search-for-primes (+ n 2) (current-time) cnt))]))
  (timed-search-for-primes start (current-time) 0))


(start-test 1000)
;; 1009 *** 19000
;; 1013 *** 12000
;; 1019 *** 18000
(start-test 10000)
;; 10007 *** 21000
;; 10009 *** 15000
;; 10037 *** 16000
(start-test 100000)
;; 100003 *** 23000
;; 100019 *** 17000
;; 100043 *** 16000
(start-test 1000000)
;; 1000003 *** 28000
;; 1000033 *** 18000
;; 1000037 *** 19000

;; gosh> (/ 26000 18000.0)
;; 1.4444444444444444
;; gosh> (/ 21000 18000.0)
;; 1.1666666666666667
;; gosh> (/ 17000 16000.0)
;; 1.0625
;; gosh> (/ 19000 17000.0)
;; 1.1176470588235294

;; log_2(10)は約10であるが、
;; 計算時間は10倍程度の増加となっていない
;; これは、fast-prime?では、prime?に比べて
;; 複雑な演算が多く含まれているため、
;; 数が小さい場合はそれらの影響が大きくなり
;; 数が小さい時の演算は処理に時間がかかるからと思われる
;; 数が大きくなるとこれらの処理の影響がなくなっていく
;; と考えられる

