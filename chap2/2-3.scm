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



(define (deriv exp var)
  (cond ((number? exp) 0)
	((variable? exp)
	 (if (same-variable? exp var) 1 0))
	((sum? exp)
	 (make-sum (deriv (addend exp) var)
		   (deriv (augend exp) var)))
	((product? exp)
	 (make-sum
	  (make-product (multiplier exp)
			(deriv (multiplicand exp) var))
	  (make-product (deriv (multiplier exp) var )
			(multiplicand exp))))
	(else
	 (error "unknown expression type -- DERIV" exp))))

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (make-sum a1 a2) (list '+ a1 a2))

(define (make-product m1 m2) (list '* m1 m2))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))

(define (augend s) (caddr s))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

(define (multiplicand p) (caddr p))

(deriv '(+ x 3) 'x)
;; gosh> (+ 1 0)

(deriv '(* x y) 'x)
;; gosh> (+ (* x 0) (* 1 y))

(deriv '(* (* x y) (+ x 3)) 'x)
;; gosh> (+ (* (* x y) (+ 1 0)) (* (+ (* x 0) (* 1 y)) (+ x 3)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
	((=number? a2 0) a1)
	((and (number? a1) (number? a2)) (+ a1 a2))
	(else (list '+ a1 a2))))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
	((=number? m1 1) m2)
	((=number? m2 1) m1)
	((and (number? m1) (number? m2)) (* m1 m2))
	(else (list '* m1 m2))))

(deriv '(+ x 3) 'x)
;; gosh> 1

(deriv '(* x y) 'x)
;; gosh> y

(deriv '(* (* x y) (+ x 3)) 'x)
;; gosh> (+ (* x y) (* y (+ x 3)))