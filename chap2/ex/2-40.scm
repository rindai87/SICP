;; 問題2.40

;; 与えられた整数nに対し、1≦j<i≦nの
;; 対(i,j)の並び

(define (unique-pairs n)
  (flatmap
   (lambda (i)
     (map (lambda (j) (list i j))
	  (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))

(unique-pairs 2)
;; gosh> ((2 1))
(unique-pairs 3)
;; gosh> ((2 1) (3 1) (3 2))
(unique-pairs 4)
;; gosh> ((2 1) (3 1) (3 2) (4 1) (4 2) (4 3))


;; unique-pairsを使ってprime-sum-pairsを
;; 簡単にする

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
	       (unique-pairs n))))

(prime-sum-pairs 6)
;; gosh> ((2 1 3) (3 2 5) (4 1 5) (4 3 7) (5 2 7) (6 1 7) (6 5 11))