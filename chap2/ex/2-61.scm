;; 問題2.61

;; 順序付けられた表現を使ったadjoin-set
(define (adjoin-set x set)
  (cond ((null? set) '(x))
	((< x (car set)) (cons x set))
	((= x (car set)) set)
	(else (cons (car set) (adjoin-set x (cdr set))))))


(adjoin-set 3 '(1 2 4 5))
;; gosh> (1 2 3 4 5)
(adjoin-set 3 '(1 2 3 4 5))
;; gosh> (1 2 3 4 5)

;; 探索対象の値と等しいか、越えた要素が見つかった時点で探索を終了する