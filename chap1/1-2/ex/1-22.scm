;; 問題1.22
;; srsi-19を利用する
(use srfi-19)

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond [(> (square test-divisor) n) n]
	[(divides? test-divisor n) test-divisor]
	[else (find-divisor n (+ test-divisor 1))]))

(define (square x)
  (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (report-time elapse-time)
  (display " *** ")
  (display (time-nanosecond elapse-time))
  (newline))

;; 方針
;; 偶数なら飛ばして奇数にする
;; 奇数で素数かどうかを判定
(define (search-for-primes start end)
  (define (timed-search-for-primes n start-time cnt)
    (cond [(or (> n end) (= cnt 3)) #t]
	  [(even? n) (timed-search-for-primes (+ n 1) (current-time) cnt)]
	  [(prime? n)
	   (begin (display n)
		  (report-time (time-difference (current-time) start-time))
		  (timed-search-for-primes (+ n 2) (current-time) (+ cnt 1)))]
	  [else (begin (display n)
		       (newline)
		       (timed-search-for-primes (+ n 2) (current-time) cnt))]))
  (timed-search-for-primes start (current-time) 0))

(define (start-test start)
  (newline)
  (search-for-primes start (* start 10)))

(start-test 1000)
;;gosh> 
;;1001
;;1003
;;1005
;;1007
;;1009 *** 27000
;;1011
;;1013 *** 26000
;;1015
;;1017
;;1019 *** 26000

(start-test 10000)
;;gosh> 
;;10001
;;10003
;;10005
;;10007 *** 55000
;;10009 *** 55000
;;10011
;;10013
;;10015
;;10017
;;10019
;;10021
;;10023
;;10025
;;10027
;;10029
;;10031
;;10033
;;10035
;;10037 *** 54000

(start-test 100000)
;;gosh> 
;;100001
;;100003 *** 132000
;;100005
;;100007
;;100009
;;100011
;;100013
;;100015
;;100017
;;100019 *** 132000
;;100021
;;100023
;;100025
;;100027
;;100029
;;100031
;;100033
;;100035
;;100037
;;100039
;;100041
;;100043 *** 132000

(start-test 1000000)
;;gosh> 
;;1000001
;;1000003 *** 416000
;;1000005
;;1000007
;;1000009
;;1000011
;;1000013
;;1000015
;;1000017
;;1000019
;;1000021
;;1000023
;;1000025
;;1000027
;;1000029
;;1000031
;;1000033 *** 430000
;;1000035
;;1000037 *** 423000

;;gosh> (/ 55000.0 27000.0)
;;2.037037037037037
;;gosh> (/ 132000.0 55000.0)
;;2.4
;;gosh> (/ 423000.0 132000.0)
;;3.20454545454546

;; (sqrt 10) = 3.162227
;; なので、数が小さい時は予想の増加の程度を下回っている
;; 一方、数が大きくなると予想の精度に近似的になる
;; 素数判定以外についやす時間のオーバーヘッドが数が大きくなるほど
;; 無視できるようになるためだと思われる