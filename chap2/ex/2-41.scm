;; 問題2.41

;; unique-pairsを使って３つ組を作る
(define (unique-triple n)
  (flatmap (lambda (i)
	     (flatmap (lambda (j)
			(map (lambda (k) (list i j k))
			     (enumerate-interval 1 (- j 1))))
		      (enumerate-interval 1 (- i 1))))
	   (enumerate-interval 1 n)))

(unique-triple 3)
;;gosh> ((3 2 1))

(unique-triple 4)
;; gosh> ((3 2 1) (4 2 1) (4 3 1) (4 3 2))


;; 3つ組の整数の和が与えられた整数となるかを
;; 判定する
(define (same-sum-triple s n)
  (define (sum-triple triple)
    (+ (car triple) (cadr triple) (caddr triple)))
  (define (same-sum? triple)
    (= (sum-triple triple) n))
  (filter same-sum?
	  (unique-triple n)))

(same-sum-triple 5 6)
;; gosh> ()
(same-sum-triple 5 6)
;; gosh> ((3 2 1))

(same-sum-triple 10 10)
;; gosh> ((5 3 2) (5 4 1) (6 3 1) (7 2 1))
(same-sum-triple 10 11)
;; gosh> ((5 4 2) (6 3 2) (6 4 1) (7 3 1) (8 2 1))
	