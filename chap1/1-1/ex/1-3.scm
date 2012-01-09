(define (sum-of-squares x y)
  (+ (* x x) (* y y)))

(define (square-of-larger-two-numbers x y z)
  (if (> x y)
      (if (> y z)
	  (sum-of-squares x y)
	  (sum-of-squares x z))
      (if (> x z)
	  (sum-of-squares x y)
	  (sum-of-squares y z))))

(define (square-of-larger-two-numbers x y z)
  (cond [(> x z) (square-of-larger-two-numbers z y x)]
	[(> y z) (square-of-larger-two-numbers x z y)]
	[else (sum-of-squares y z)]))