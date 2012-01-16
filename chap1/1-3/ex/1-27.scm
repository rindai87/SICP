;; 問題1.27

(define (expmod base exp m)
  (define (square x)
    (* x x)) 
  (cond [(= exp 0) 1]
        [(even? exp)
         (remainder (square (expmod base (/ exp 2) m)) 
                    m)] 
        [else
         (remainder (* base (expmod base (- exp 1) m)) 
                    m)]))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (define (iter-test a)
    (if (= a n)
	#t
	(and (try-it a)
	     (iter-test (+ a 1)))))
  (iter-test 1))

(fermat-test 561)
;; gosh> #t
(fermat-test 1105)
;; gosh> #t
(fermat-test 1729)
;; gosh> #t
(fermat-test 2465)
;; gosh> #t
(fermat-test 2821)
;; gosh> #t
(fermat-test 6601)
;; gosh> #t

(fermat-test 10)
;; gosh> #f