;; 問題2.32

;; 集合の全ての部分集合の集合を表現する
;; 冪集合の話

;; 冪集合Xは集合Xの全ての部分集合の集合
;; => Xのある要素を抜き出した集合の部分集合と、各部分集合にXを加えた和集合
;; => subsets内のrestが先頭要素を取り除いたもの
;; => そこに取り除いた先頭要素を加えればよい？？
;; (subset (cdr (1 2 3)))
;; => (subset (2 3)) だから 1を加えるような処理
;; => (append (map <1を加えるような手続き> rest))
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


;; http://d.hatena.ne.jp/awacio/20100512/1273670118
