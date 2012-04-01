;; 問題2.34

;; Hornerの方法

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) (+ this-coeff (* x higher-terms)))
	      0
	      coefficient-sequence))

(horner-eval 2 (list 1 3 0 5 0 1))
;; gosh> 79

;; (+ (car (list 1 3 0 5 0 1))
;;    (* 2 (accumulate op 0 (cdr (list 1 3 0 5 0 1)))))...