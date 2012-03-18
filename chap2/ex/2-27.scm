;; 問題2.27

(define x (list (list 1 2) (list 3 4)))

;; reverseはgauche組み込みであるけど、念のために
(define (reverse-new items)
  (define (reverse-iter rev-items items)
    (if (null? items)
	rev-items
	(reverse-iter (cons (car items) rev-items) (cdr items))))
  (reverse-iter () items))

(reverse-new (list 1 2 3 4))

(define (deep-reverse tree)
  (if (not (pair? tree))
      tree
      (reverse (map deep-reverse tree))))

x
;; gosh> ((1 2) (3 4))

(reverse x)
;; gosh> ((3 4) (1 2))

(deep-reverse x)
;; gosh> ((4 3) (2 1))