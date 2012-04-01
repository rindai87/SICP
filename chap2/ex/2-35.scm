;; 問題2.35

(define (count-leaves x)
  (cond ((null? x) 0)
	((not (pair? x)) 1)
	(else (+ (count-leaves (car x))
		 (count-leaves (cdr x))))))

(count-leaves (list 1 2 3 4 5))
;; gosh> 5

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x)
			 (cond ((null? x) 0)
			       ((not (pair? x)) 1)
			       (else count-leaves x)))
		       t)))

(count-leaves (list 1 2 3 4 5))
;; gosh> 5