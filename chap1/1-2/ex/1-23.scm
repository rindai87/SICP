;; 問題2.13

(define (next n)
  (if (= n 2) 3
      (+ n 2)))

(define (find-divisor n test-divisor)
  (cond [(> (square test-divisor) n) n]
	[(divides? test-divisor n) test-divisor]
	[else (find-divisor n (next test-divisor))]))


(start-test 1000)
;; 1009 *** 13000
;; 1013 *** 13000
;; 1019 *** 14000
(start-test 10000)
;; 10007 *** 39000
;; 10009 *** 35000
;; 10037 *** 34000
(start-test 100000)
;; 100003 *** 103000
;; 100019 *** 103000
;; 100043 *** 103000
(start-test 1000000)
;; 1000003 *** 367000
;; 1000033 *** 324000
;; 1000037 *** 342000

;; 問題1.22の値
;;1009 *** 27000
;;1013 *** 26000
;;1019 *** 26000
;;10007 *** 55000
;;10009 *** 55000
;;10037 *** 54000
;;100003 *** 132000
;;100019 *** 132000
;;100043 *** 132000
;;1000003 *** 416000
;;1000033 *** 430000
;;1000037 *** 423000

;;gosh> (/ 26000 13000.0)
;;2.0
;;gosh> (/ 55000 35000.0)
;;1.5714285714285714
;;gosh> (/ 132000 103000.0)
;;1.2815533980582525
;;gosh> (/ 423000 342000.0)
;;1.236842105263158

;; 小さな値の時は期待通り1/2になっているが、
;; 値が大きくなるにつれて1/2ではなくなっている
;; 値が大きくなるに連れて、nextのオーバーヘッドが
;; 1つずつ探索することと比較する効果が薄れていく
;; のではないかと考えられる