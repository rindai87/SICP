;; 問題1.44

;; n重平滑化関数の手続き

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter i g)
    (if (= i n)
	g
        (iter (+ i 1) (compose f g))))
  (iter 1 f))

(define (smooth f)
  (define dx 0.00001)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (n-fold-smooth f n)
  (repeated (smooth f) n))