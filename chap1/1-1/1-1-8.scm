;; ブラックボックス抽象としての手続き

;; squareを一度定義すると
;; その手続きを呼び出すときには
;; ２乗の値を返すブラックボックスとして
;; 見ることができる
;; ブラックボックスとして呼び出すときには、
;; squareは単なる手続きではなく
;; 手続きの抽象「手続き抽象(procedural abstraction)」
;; である。

;; どちらの例もxを引数にとり、その２乗を返す。
(define (square x) (* x x))

;; exp(log x + log x)
;; => exp(2log(x))
;; => exp(log(x^2))
;; => x^2
(define (square x)
  (exp (double (log x))))
(define (double x) (+ x x))

(square 2)


;; 局所名
;; 手続きの意味はパラメタ名とは無関係であるという原則
(define (square x) (* x x))
(define (square y) (* y y))

;; (square x)のパラメタxが手続きに対して局所的でないなら
;; (good-enough? guess x)のパラメタxと混同されてしまう。
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

;; 手続きの仮パラメタには、手続き定義の中で、
;; 仮パラメタがどんな値を持っていても
;; かまわないという、特別な役割がある。
;; => 束縛変数(bound variable)
;; 手続き定義は仮パラメタを束縛する(bound)。
;; 変数が束縛されてなければ自由である(fee)。
;; 名前が束縛されている式の範囲を有効範囲(scope)という。
;; (good-enough?)では
;;   guess, xが束縛変数
;;   abs, square, <, -が自由
;;   guess, xの有効範囲は(good-enou?）内のみ



;; 内部定義とブロック構造

;; 手続きはその手続きに局所的な内部定義ができる
;; 定義の入れ子構造をブロック構造という
;; sqrt内では、xが束縛変数であるため、内部定義
;; に対しては有効範囲内である。
;; そのために内部手続きには明示的にxをパラメタとして
;; 渡す必要はない。
;; 内部手続き内ではxを自由変数にしておくことで、
;; sqrtが受け取った引数から値を取得する。
;; => この方法を静的有効範囲(lexical scoping)という。
(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess x)
    (average guess (/ x guess)))
  (define (sqrt-iter guess x)
    (if (good-enough? guess)
	guess
	(sqrt-iter (improve guess x) x)))
  (define (square x)
    (* x x))
  (define (average x y)
    (/ (+ x y ) 2))
  (define (abs x)
    (if (< x 0)
	(- x)
	x))
  (sqrt-iter 1.0 x))