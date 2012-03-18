;; 問題2.32

;; 集合の全ての部分集合の集合を表現する
;; 冪集合の話に帰着する

;; subsetsから先頭の要素xを除いた集合の冪集合と、その各要素にxを加えた集合の和集合
;; (subset (cdr (1 2 3)))
;; => (subset (2 3)) だから 1を加えるような処理
;; => 空欄部分は(append (map <(lambda (x) (cons (car s) x))> rest))

(define nil '())

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
	(append rest (map (lambda (x) (cons (car s) x)) rest)))))

(print (subsets (list 1 2 3)))
;; gosh> (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
;; #<undef>


(use slib)
(require 'trace)
(trace subsets)
(print (subsets (list 1 2 3)))
;; gosh> CALL subsets (1 2 3)
;;   CALL subsets (2 3)
;;     CALL subsets (3)
;;       CALL subsets ()
;;       RETN subsets (())
;;     RETN subsets (() (3))
;;   RETN subsets (() (3) (2) (2 3))
;; RETN subsets (() (...) (...) (...) (1) (1 ...) (1 2) (1 2 3))



;; s = (list 1 2 3)
(append (subsets (cdr s))
	(map (lambda (x) (cons (car s) x)) (subsets (cdr s))))
