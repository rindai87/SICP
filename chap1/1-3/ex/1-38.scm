;; 問題1.38

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


(define (e-2 k)
  (define (n i) 1.0)
  (define (d i) 
    (if (= (remainder i 3) 2)
	(* 2 (+ 1 (quotient i 3)))
	1))
  (conf-frac n d k))

(define (e k)
  (+ 2 (e-2 k)))

(e 7)
;; gosh> 2.7183098591549295
(e 8)
;; gosh> 2.718279569892473
(e 9)
;; gosh> 2.718283582089552
(e 10)
;; gosh> 2.7182817182817183


;; こういうやり方もある
(define (cont-frac n d k)
  (define (iter i)
    (if (= i k)
	(/ (n k) (d k))
	(/ (n i) (+ (d i) (iter (+ i 1))))))
  (iter 1))

(define (e-2 k)
  (cont-frac (lambda (x) 1.0)
	     (lambda (x)
	       (if (= (remainder x 3) 2)
		   (* 2 (+ 1 (quotient x 3)))
		   1.0))
	    10.0))
