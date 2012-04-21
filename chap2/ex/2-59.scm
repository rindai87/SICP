;; 問題2.59

;; 二つの集合の和集合を計算するunion-set

(define (union-set set1 set2)
  (cond ((null? set1) set2)
	((null? set2) set1)
	((element-of-set? (car set1) set2)
	 (union-set (cdr set1) set2))
	(else (cons (car set1)
		    (union-set (cdr set1) set2)))))

(union-set '(1 2 3) '(4 5 6))
;; gosh> (1 2 3 4 5 6)
(union-set '(1 2 3) '())
;; gosh> (1 2 3)
(union-set '() '(4 5 6))
;; gosh> (4 5 6)
(union-set '(1 2 3) '(2 3 4))
;; gosh> (1 2 3 4)