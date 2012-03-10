;; 問題2.20

;; ドット末尾記法を使って
;; １つかそれを超える引数を取り
;; 先頭と同じ偶奇性を持つ引数のリストを返す手続き
(define (same-parity head . remaind)
  (define (filter pred items)
    (cond [(null? items) ()]
	  [(pred (car items))
	   (cons (car items) (filter pred (cdr items)))]
	  [else
	   (filter pred (cdr items))]))
  (if (odd? head)
      (cons head (filter odd? remaind))
      (cons head (filter even? remaind))))

(same-parity 1 2 3 4 5 6 7)
;; gosh> (1 3 5 7)

(same-parity 2 3 4 5 6 7)
;; gosh> (2 4 6)
