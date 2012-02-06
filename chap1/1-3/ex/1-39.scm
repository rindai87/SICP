;; 問題1.39

;; 再帰版のconf-fracを利用する
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
		(accumulate combiner null-value term (next a) next b))))

(define (conf-frac n d k)
  (define (conf-frac-combiner i bunbo)
    (/ (n i) (+ (d i) bunbo)))
  (define (conf-frac-term i) i)
  (define (conf-frac-next i) (+ i 1))
  (accumulate conf-frac-combiner (/ (n k) (d k)) conf-frac-term 1 conf-frac-next (- k 1)))

(define (tan-cf x k)
  (let ((xtanx (conf-frac (lambda (i) (* -1 (* x x)))
			  (lambda (i) (- (* 2 i) 1))
			  k)))
    (* -1 (/ xtanx x))))

(use math.const)
(tan-cf (/ pi 4) 8)

;; こういうのもある
(define (tan-cf x k)
  (define (iter i)
    (cond [(> i k) 0]
	  [(= i 1)
	   (/ x (- 1 (iter 2)))]
	  [else
	   (/ (* x x)
	      (- (- (* i 2) 1) (iter (+ i 1))))])))
  (iter 1))