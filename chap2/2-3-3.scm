;; 2.3.3 例：集合の表現

;; 順序づけられないリストとしての集合
(define (element-of-set? x set)
  (cond ((null? set) #f)
	((equal? x (car set)) #t)
	(else (element-of-set? x (cdr set)))))

(element-of-set? 2 '(1 2 3 4))
;; gosh> #t
(element-of-set? 5 '(1 2 3 4))
;; gosh> #f

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(adjoin-set 1 '(1 2 3 4))
;; gosh> (1 2 3 4)
(adjoin-set 5 '(1 2 3 4))
;; gosh> (5 1 2 3 4)


(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
	((element-of-set? (car set1) set2)
	 (cons (car set1)
	       (intersection-set (cdr set1) set2)))
	(else (intersection-set (cdr set1) set2))))

(intersection-set '(1 2 3) '(4 5 6))
;; gosh> ()
(intersection-set '(3 4 5) '(4 5 6))
;; gosh> (4 5)
