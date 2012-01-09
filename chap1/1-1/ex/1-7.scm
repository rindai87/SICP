;; 非常に小さな数の場合
;; 1e-4(0.0001) => 0.01になって欲しい
(sqrt 0.0001)
(sqrt 1e-4)
;; 10E-6(0.000001) => 0.001になってほしい
(sqrt 0.000001)
(sqrt 1e-6)
(sqrt 1e-2)
;; 理由
;; (good-enough? guess x)
;; => abs(guess^2 - x) < 0.001
;; => abs(guess^2 - 0.0001) < 0.001
;; 予測値guess^2が閾値(0.001)より小さくなると、
;; xが閾値よりも小さな値のため
;; そこで繰り返しがストップしてしまう。
;; 例：guess^2 = 0.0005
;;    0.0005 - 0.0001 = 0.0004
;;    =>条件を満たしストップ

;; 非常に大きな数の場合
;; 1e12 => 1e6になって欲しい
(sqrt 1000000000000)
(sqrt  1e12)
;; それ以上だとループがとまらない
(sqrt 10000000000000)
(sqrt 1e13)
;; でも偶数だけは実はうまく動く
(sqrt 1e14)
(sqrt 1e16)
(sqrt 1e18)
(sqrt 1e20)
;; 1e48までは大丈夫
(sqrt 1e48)
;; 1e50になると無限ループになって止まらなくなる
(sqrt 1e50)

;; 理由(前半まで)
;; 絶対値が大きな数と絶対値が小さな数で計算をすると
;; 絶対値が小さな方の数が無視されてしまう現象(情報落ち)
;; gaucheの浮動小数点の実装は
;; IEEE 64bit型の浮動小数点(C言語のdoubleと同じ)
;; 符号部1ビット、指数部11ビット、仮数部52ビット
;; 2^{-9} = 0.001953125
;; 2^{-10} = 0.0009765625
;; => 10ビット必要
;; 残りの42ビットで表現できる範囲が、0.001と同時に表現できる数
;; 2^42 = 4398046511104 = (13桁)
;; 2^41 = 2199023255552 = (13桁)
;; 1e12までは表す事ができる。
;; 1e13以上の数字では0.001以下の数が表現できなくなる。
;; 条件式を満たせなくなり無限ループになる。

;; sqrtを計算する本体に途中経過を出力させる
(define (sqrt-iter guess x)
  (print guess)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))



;; 更新を終了させる実装
(define (new-sqrt-iter last-guess guess x)
  (if (new-good-enough? last-guess guess)
      guess
      (new-sqrt-iter guess (improve guess x) x)))

(define (new-good-enough? last-guess guess)
  (> 0.001
   (abs (- (/ last-guess guess) 1))))


(define (new-sqrt x)
  (new-sqrt-iter 2.0 1.0 x))


;; 先ほど失敗した例がうまくいくか?
;; 非常に小さな数の場合
(new-sqrt 1e-4)
(new-sqrt 1e-6)
(new-sqrt 1e-8)
(new-sqrt 1e-10)
(new-sqrt 1e-30)
(new-sqrt 1e-100)
;; 平方根の結果がgood-enough?の基準を
;; 越えるような数では改善前と同じ理由で
;; うまくいかなくなる。
;; 精度を挙げるには閾値を小さくすればよい

;; 非常に大きな数の場合
(new-sqrt 1e12)
(new-sqrt 1e13)
(new-sqrt 1e14)
(new-sqrt 1e15)
(new-sqrt 1e49)
(new-sqrt 1e50)
(new-sqrt 1e100)
(new-sqrt 1e120)
(new-sqrt 1e200)
(new-sqrt 1e300)
;; うまくいくようになる。