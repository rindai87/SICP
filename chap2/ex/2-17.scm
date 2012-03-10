;; 問題2.17

;; 与えられたリストの最後の要素だけからなるリスト
;; を返す手続きlast-pair

(define (last-pair items)
  (if (null? (cdr items))
      (list (car items))
      (last-pair (cdr items))))

(last-pair (list 23 72 149 34))
;; gosh> (34)
