;; 問題2.25

(1 3 (5 7) 9)
(define x (list 1 3 (list 5 7) 9))
(car (cdr (car (cdr (cdr x)))))
;; gosh> 7
;; cdr => cdr => car => cdr => car 

((7))
(define x (list (list 7)))
(car (car x))
;; gosh> 7
;; car => car 
(caar x)
;; gosh> 7

(1 (2 (3 (4 (5 (6 7))))))
(define x (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr x))))))))))))
;; gosh> 7
;; cdr => car
;; => cdr => car 
;; => cdr => car
;; => cdr => car
;; => cdr => car
;; => cdr => car