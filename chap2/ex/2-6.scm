;; 問題2.6

;; zeroとadd-1を使わずにoneとtwoを実装
;; add-1を繰り返さずに+を定義する

;; 0の定義
(define zero (lambda (f) (lambda (x) x)))
;; 引数として手続きfをとり、
;; 引数としてxをとりxを返す手続きを返す

;; 1をたす演算
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
;; 引数として手続きnをとる
;; 引数として

;; http://www23.atwiki.jp/selflearn/pages/16.html#id_e78ae615
;; http://blog.livedoor.jp/dankogai/archives/50458503.html
;; http://d.hatena.ne.jp/tsz/20090110/1231604057
;; 要は、ある数は、ある関数fを何回xに適用するか、という定義にしてしまうのである。
(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))
(define three (lambda (f) (lambda (x) (f (f (f x))))))

;; 1を加えるという処理を複数回繰り返して0,1を実現
;; 数値として見えるようにincrement処理をする引数を与えてみる
((one (lambda(x) (+ x 1))) 0)
((two (lambda(x) (+ x 1))) 0)


;; 足し算
;; fをb回適用した後に、fをa回適用する
;; fをb回適用した値に、fをa回適用することで実現
(define (add a b)
  (lambda (f)
    (lambda (x)
      ((a f) ((b f) x)))))

(((add one two) (lambda (x) (+ x 1))) 0)
;; gosh> 3

(((add one one) (lambda (x) (+ x 1))) 0)
;; gosh> 2

(((add two two) (lambda (x) (+ x 1))) 0)
;; gosh> 4



;; べき乗
;; bにaを
(define (exp a b)
  (b a))

(((exp two three) (lambda (x) (+ x 1))) 0)
;; 2**3
;; gosh> 8

(((exp tree three) (lambda (x) (+ x 1))) 0)
;; 3**3
;; gosh> 27


;; 掛け算
;; fをb回適用させた手続きにa回適用させる
;; ↑でb*aを実現
(define (mul a b)
  (lambda (f)
    (lambda (x)
      ((a (b f)) x))))

(((mul two two) (lambda (x) (+ x 1))) 0)
;; 2 * 2
;; gosh> 4

(((mul two three) (lambda (x) (+ x 1))) 0)
;; 2 * 3
;; gosh> 6



;; チャーチ数の引き算
(define zz (cons zero zero))
(define ss 
  (lambda (p)
    (cons (cdr p)
	  (add-1 (cdr p)))))

(define (sub-1 n)
  (car ((n ss) zz)))

(define (sub n1 n2)
  ((n2 sub-1) n1))


(((sub-1 two) (lambda (x) (+ x 1))) 0)
(((sub-1 three) (lambda (x) (+ x 1))) 0)

(((sub three two) (lambda (x) (+ x 1))) 0)
(((sub three one) (lambda (x) (+ x 1))) 0)