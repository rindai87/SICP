;; 公認インターフェース

;; 引数として木を取り、奇数である葉の二乗の和を
;; 計算する手続き

(define (square x) (* x x))

(define (sum-odd-squares tree)
  (cond ((null? tree) 0)
	((not (pair? tree))
	 (if (odd? tree) (square tree) 0))
	(else (+ (sum-odd-squares (car tree))
		 (sum-odd-squares (cdr tree))))))

(sum-odd-squares (list 1 (list 2 3) (list 3 5 (list 4 7)) 3 2))

(define (even-fib n)
  (define (next k)
    (if (> k n)
	nil
	(let ((f (fib k)))
	  (if (even? f)
	      (cons f (next (+ k 1)))
	      (next (+ k 1))))))
  (next 0))


;; 並びの演算
(map square (list 1 2 3 4 5))
;; gosh> (1 4 9 16 25)

(define (filter predicate sequence)
  (define nil '())
  (cond ((null? sequence) nil)
	((predicate (car sequence))
	 (cons (car sequence)
	       (filter predicate (cdr sequence))))
	(else (filter predicate (cdr sequence)))))

(filter odd? (list 1 2 3 4 5))
;; gosh> (1 3 5)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(accumulate + 0 (list 1 2 3 4 5))
;; gosh> 15

(accumulate * 1 (list 1 2 3 4 5))
;; gosh> 120

(define nil '())
(accumulate cons nil (list 1 2 3 4 5))
;; gosh> (1 2 3 4 5)


(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(enumerate-interval 2 7)
;; gosh> (2 3 4 5 6 7)


(define (enumerate-tree tree)
  (cond ((null? tree) nil)
	((not (pair? tree)) (list tree))
	(else (append (enumerate-tree (car tree))
		      (enumerate-tree (cdr tree))))))

(enumerate-tree (list 1 (list 2 (list 3 4)) 5))
;; gosh> (1 2 3 4 5)


(define (sum-odd-squares tree)
  (accumulate +
	      0
	      (map square
		   (filter odd?
			   (enumerate-tree tree)))))

(define (fib n)
  (cond ((= n 0) 0)
	((= n 1) 1)
	(else (+ (fib (- n 1))
		 (fib (- n 2))))))

(define (even-fibs n)
  (accumulate cons
	      nil
	      (filter even?
		      (map fib
			   (enumerate-interval 0 n)))))

(define (list-fib-squares n)
  (accumulate cons
	      nil
	      (map square
		   (map fib
			(enumerate-interval 0 n)))))

(list-fib-squares 10)
;; gosh> (0 1 1 4 9 25 64 169 441 1156 3025)

(define (product-of-squares-of-odd-elements sequence)
  (accumulate *
	      1
	      (map square
		   (filter odd? sequence))))

(product-of-squares-of-odd-elements (list 1 2 3 4 5))
;; gosh> 225


(define (salary-of-highest-paid-programmer records)
  (accumulate max
	      0
	      (map salary
		   (filter programmer? records))))

(define n 6)
(accumulate append
	    nil
	    (map (lambda (i)
		   (map (lambda (j) (list i j))
			(enumerate-interval 1 (- i 1))))
		 (enumerate-interval 1 n)))
;; gosh> ((2 1) (3 1) (3 2) (4 1) (4 2) (4 3) (5 1) (5 2) (5 3) (5 4) (6 1) (6 2) (6 3) (6 4) (6 5))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
	       (flatmap
		(lambda (i)
		  (map (lambda (j) (list i j))
		       (enumerate-interval 1 (- i 1))))
		(enumerate-interval 1 n)))))

(define (smallest-divisor n)
  (find-divisor n 2))

c(define (find-divisor n test-divisor)
  (cond [(> (square test-divisor) n) n]
	[(divides? test-divisor n) test-divisor]
	[else (find-divisor n (+ test-divisor 1))]))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(prime-sum-pairs 3)
;; gosh> ((2 1 3) (3 2 5))



;; 順列
(define (permutations s)
  (if (null? s)
      (list nil)
      (flatmap (lambda (x)
		 (map (lambda (p) (cons x p))
		      (permutations (remove x s))))
		 s)))

(define (remove item sequence)
  (filter (lambda (x) (not (= x item)))
	  sequence))

(permutations (list 1 2 3))
;; gosh> ((1 2 3) (1 3 2) (2 1 3) (2 3 1) (3 1 2) (3 2 1))