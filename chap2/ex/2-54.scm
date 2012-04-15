;; 問題2.54

(equal? '(this is a list) '(this is a list))
;; gosh> #t
(equal? '(this is a list) '(this (is a) list))
;; gosh> #f

(define (equal? x y)
  (cond ((and (null? x) (null? y)) #t)
	((and (pair? x) (pair? y))
	 (and (equal? (car x) (car y))
	      (equal? (cdr x) (cdr y))))
	((and (not (pair? x)) (not (pair? y)))
	 (eq? x y))
	(else #f)))

(equal? '(this is a list) '(this (is a) list))
;; gosh> #f

(define (my-equal? a b)
  (cond ((and (null? a) (null? b))
	 #t)
	((and (not (null? a)) (not (null? b)))
	 (if (eq? (car a) (car b))
	     (equal? (cdr a) (cdr b))
	     #f))
	(else
	 #f)))
