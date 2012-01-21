;; 問題1.29
;; Simpsonの公式

(define (even? n)
  (= (remainder n 2) 0))

(define (cube n)
  (* n n n))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

(define (simpson f a b n)
    (define h
      (/ (- b a) n))
    (define (next k)
      (+ k 1))
    (define (y k)
      (f (+ a (* k h))))
    (define (term k)
      (cond [(or (= 0 k) (= n k)) (y k)]
	    [(even? k) (* 2 (y k))]
	    [else (* 4 (y k))]))
    (* (sum term 0 next n)
       (/ h 3)))


(simpson cube 0 1.0 100)
;; gosh> 0.24999999999999992
(simpson cube 0 1.0 1000)
;; gosh> 0.2500000000000003