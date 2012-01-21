;; 問題1.34

(define (f g)
  (g 2))

(define (square x)
  (* x x))

(f square)
;;gosh> 4
;; (f square) => (square 2)

(f (lambda (z) (* z (+ z 1))))
;;gosh> 6
;; ((lambda (z) (* z (+ z 1))) 2)
;; => 6

(f f)
;;gosh> *** ERROR: invalid application: (2 2)
;;Stack Trace:
;;_______________________________________

;; (f f)
;; => (f 2)
;; => (2 2)
;; 置き換えモデルに従うと上記のようになる。
;; 最終的に手続きでない2に引数2を与えて評価
;; しようとしてエラーになる。