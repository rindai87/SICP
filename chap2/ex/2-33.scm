;; 問題2.33

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define nil '())

;; map
(define (map2 p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(map2 square (list 1 2 3 4 5))
;; gosh> (1 4 9 16 25)


;; append
(define (append2 seq1 seq2)
  (accumulate cons seq2 seq1))

(append2 (list 1 2 3 4 5) (list 5 4 3 2 1))
;; gosh> (1 2 3 4 5 5 4 3 2 1)
;; (cons (car seq1)
;;       (accumulate cons seq2 (cdr seq1)))...


;; length
(define (length2 sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

(length2 (list 1 2 3 4 5))
;; gosh> 5
;; (accumulate (lambda (x y) (+ 1 y)) initial (cdr sequence))...

