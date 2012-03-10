;; 問題2.18

;; 引数としてリストをとり、同じ要素の逆順のリストを返す
;; 手続きreverseを定義せよ

;; gaucheにreverseが実装されているので
;; reverse-newとして実装する

(define (reverse-new items)
  (define (reverse-iter rev-items items)
    (if (null? items)
	rev-items
	(reverse-iter (cons (car items) rev-items) (cdr items))))
  (reverse-iter () items))

(reverse-new (list 1 4 9 16 25))
;; gosh> (25 16 9 4 1)
