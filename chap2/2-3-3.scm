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



;; 順序付けられたリスト
(define (element-of-set? x set)
  (cond ((null? set) #f)
	((= x (car set)) #t)
	((< x (car set)) #f)
	(else (element-of-set? x (cdr set)))))

(element-of-set? 3 '(1 2 3 4 5))
;; gosh> #t
(element-of-set? 3 '(1 2 4 5))
;; gosh> #f

(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1))
	    (x2 (car set2)))
	(cond ((= x1 x2)
	       (cons x1
		     (intersection-set (cdr set1)
				       (cdr set2))))
	      ((< x1 x2)
	       (intersection-set (cdr set1) set2))
	      ((> x1 x2)
	       (intersection-set set1 (cdr set2)))))))



;; 二進木としての集合
(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (element-of-set? x set)
  (cond ((null? set) #f)
	((= x (entry set)) #t)
	((< x (entry set))
	 (element-of-set? x (left-branch set)))
	((> x (entry set))
	 (element-of-set? x (right-branch set)))))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
	((= x (entry set)) set)
	((< x (entry set))
	 (make-tree (entry set)
		    (adjoin-set x (left-branch set))
		    right-branch set))
	((> x (entry set))
	 (make-tree (entry set)
		    (left-branch set)
		    (adjoin-set x (right-branch set))))))
