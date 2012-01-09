;; factorialのtrace
(use slib)
(require 'trace)
(trace factorial)


;; 階乗の計算
(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))
;; 6! = 720
(trace factorial)
(factorial 6)

;; 階乗の計算の別の例
(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* product counter)
		 (+ counter 1)
		 max-count)))
(define (factorial n)
  (fact-iter 1 1 n))

;; 6! = 720
(trace fact-iter)
(factorial 6)