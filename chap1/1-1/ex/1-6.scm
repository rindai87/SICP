;; new-ifの定義
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

;; 期待通り動作する例
(new-if (= 2 3) 0 5)
(new-if (= 1 1) 0 5)

;; 先ほどの平方根を求める処理の一部に
;; new-ifを利用する。
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
	  guess
	  (sqrt-iter (improve guess x)
		     x)))

(use slib)
(require 'trace)
(trace sqrt-iter)
;; 期待通り動作するか確かめる
(sqrt 9)
;; 無限ループになり期待通り動作しない

;; P12
;; 特殊形式のif
;; 述語式を最初に評価し、その結果が帰結式と代替式の
;; いずれを評価するかを決める

;; new-if(一般形式)
;; 作用的順序で評価されるため
;; 帰結式、代替式の双方が評価される。
;; その結果sqrt-iterが再帰的に呼び出され続け終了しない。