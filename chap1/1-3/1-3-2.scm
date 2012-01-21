;; 補助の手続きを使わないpi-sum
(define (pi-sum a b)
  (sum (lambda (x) (/ 1.0 (* x (+ x 2))))
       a
       (lambda (x) (+ x 4))
       b))

;; 補助の手続きadd-dxを使わないintegral
(define (integral f a b dx)
  (* (sum f
	  (+ a (/ dx 2.0))
	  (lambda (x) (+ x dx))
	  b)
     dx))


;; 補助手続きを使い、局所変数を束縛する方法
(define (f x y)
  (define (f-helper a b)
    (+ (* x (square a))
       (* y b)
       (* a b)))
  (f-helper (+ 1 (* x y))
	    (- 1 y)))

;; lambdaを使う場合
(define (f x y)
  ((lambda (a b)
    (+ (* x (square a))
       (* y b)
       (* a b)))
   (+ 1 (* x y))
   (- 1 y)))

;; 更にletを用いた場合
(define (f x y)
  (let ((a (+ 1 (* x y)))
	(b (- 1 y)))
    (+ (* x (square a))
       (* y b)
       (* a b))))

;; letの範囲を確認
(define x 5)

(+ (let ((x 3))
     (+ x (* x 10)))
   x)
;;gosh> 38
;; (+ 3 (* 3 10)
;;    5)  => 38


;; letの局所変数名とletの外側の変数名が重複しているとき
(define x 2)

(let ((x 3)
      (y (+ x 2)))
  (* x y))
;;gosh> 12
;; let内のx,yはそれぞれ、x=>3, y=>2+2=4


;; letと同じ働きをえるために内部defineを使った場合
(define (f x y)
  (define (square x)
    (* x x))
  (define a (+ 1 (* x y)))
  (define b (- 1 y))
  (* (* x (square a))
     (* y a)
     (* a b)))