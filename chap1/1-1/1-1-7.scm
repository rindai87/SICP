;; Newton法で平方根の計算を実装

;; Newton法
;; f(x) = 0と問題を定式化して
;; 予想点x_0におけるf(x)の接線と
;; そのx切片を計算する
;; x切片は予測点よりも解に近くなっているはず
;; 上の処理を繰り返す
;; x_{n+1} = x_{n} - f(x_{n})/f'(x_{n})

;; 平方根の場合は
;; aの平方根をxとすると
;; \sqrt{a} = x
;; f(x) = x^2 - a = 0
;; 更新式は
;; x_{n+1} = (x_{n} + a/x_{n}) / 2


;; sqrtを計算する手続き
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

;; 更新式の手続き
(define (improve guess x)
  (average guess (/ x guess)))

;; 平均を算出するaverage
(define (average x y)
  (/ (+ x y) 2))


;; 予測値の２乗との差が閾値以下になるかを
;; 判定する手続き
(define (good-enough? guess x)
  (< (abs (- (square guess)
	     x))
	  0.001))

;; 絶対値を求めるabs
(define (abs x)
  (if (< x 0)
      (- x)
      x))

;; 2乗を計算するabs
(define (square x)
  (* x x))

;; sqrt本体。予測値を1.0として始める
;; P13の脚注より
;; MITのSchemeでは、正確な整数と小数は区別し、
;; 二つの整数の序算は小数ではなく、有理数を作る。
;; Gaucheもそうなっている。
;; gosh> (/ 10 6)
;; 5/3
;; gosh> (/ 10.0 6.0)
;; 1.6666666666666667
(define (sqrt x)
  (sqrt-iter 1.0 x))


;; sqrtを確かめる
(sqrt 9)
(sqrt (+ 100 37))
(sqrt (+ (sqrt 2) (sqrt 3)))
(square (sqrt 1000))