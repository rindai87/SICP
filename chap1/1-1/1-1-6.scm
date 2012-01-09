(define (abs x)
  (cond [(> x 0) x]
	[(= x 0) 0]
	[(< x 0) (- x)]))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (>= x y)
  (or (> x y)
      (= x y)))

(define (>= x y)
  (not (< x y)))