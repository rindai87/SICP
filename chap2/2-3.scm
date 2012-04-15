;; 2.3 記号データ

(define a 1)

(define b 2)

(list a b)
;; gosh> (1 2)

(list 'a 'b)
;; gosh> (a b)

(list 'a b)
;; gosh> (a 2)

(car '(a b c))
;; gosh> a

(cdr '(a b c))
;; gosh> (b c)

(define (memq item x)
  (cond ((null? x) #f)
	((eq? item (car x)) x)
	(else (memq item (cdr x)))))

(memq 'apple '(pear banana prune))
;; gosh> #f

(memq 'apple '(x (apple sauce) y apple pear))
;; gosh> (apple pear)