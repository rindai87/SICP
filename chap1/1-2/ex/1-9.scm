(use slib)
(require 'trace)

(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

(trace +)
(trace dec)
(trace inc)
(+ 4 5)
;; (inc (+ (dec 4) 5))
;; (inc (inc (+ (dec 3) 5)))
;; (inc (inc (inc (+ (dec 2) 5))))
;; (inc (inc (inc (inc (+ (dec 1) 5)))))
;; (inc (inc (inc (inc (inc (+ 0) 5)))))
;; (inc (inc (inc (inc 5))))
;; (inc (inc (inc 6)))
;; (inc (inc 7))
;; (inc 8)
;; => 9
;; aが0になるまでdecを繰り返す
;; decを繰り返した回数分incする
;; 膨張と収縮の形となっているので再帰的プロセスである。


(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

(trace +)
(trace dec)
(trace inc)
(+ 4 5)
;; (+ (dec 4) (inc 5))
;; (+ (dec 3) (inc 6))
;; (+ (dec 2) (inc 7))
;; (+ (dec 1) (inc 8))
;; => 9
;; aをdecすると同時にbをincする。
;; decを繰り返した回数分incされ、
;; aが0になった段階でbが求められている。
;; プロセスが伸び縮みしないので反復的プロセスである。

;; dec, incの実装
(define (dec x)
  (- x 1))

(define (inc x)
  (+ x 1))

(dec 3)
(inc 3)