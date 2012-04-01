;; 問題2.38
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
	result
	(iter (op result (car rest))
	      (cdr rest))))
    (iter initial sequence))

(fold-right / 1 (list 1 2 3))
;;(/ 1 (/ 2 (/ 3 1)))
;; gosh> 3/2

(fold-left / 1 (list 1 2 3))
;;(iter (/ 1 1) (2 3))
;;(iter (/ 1 2) (3))
;;(iter (/ 2 3) ())
;; gosh> 1/6

(fold-right list nil (list 1 2 3))
;; gosh> (1 (2 (3 ())))

(fold-left list nil (list 1 2 3))
;; gosh> (((() 1) 2) 3)

;; (op a b) = (op b a)が成り立つ時、
;; fold-rightとfold-leftはどのような並びに対しても
;; 同じ値を生じる