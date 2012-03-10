;; 問題2.21

;; 引数として数のリストをとり、2乗のリストを返す
;; square-listについて

(define (square-list items)
  (if (null? items)
      ()
      (cons (* (car items) (car items))
	    (square-list (cdr items)))))

(square-list (list 1 2 3 4))
;; gosh> (1 4 9 16)

(define (square-list items)
  (map (lambda (x) (* x x)) items))

(square-list (list 1 2 3 4))
;; gosh> (1 4 9 16)