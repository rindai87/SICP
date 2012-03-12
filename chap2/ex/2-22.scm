;; 問題2.22

(define (square-list items)
  (define (square x)
    (* x x))
  (define (iter things answer)
    (if (null? things)
	answer
	(iter (cdr things)
	      (cons (square (car things)) answer))))
  (iter items ()))

(square-list (list 1 2 3 4))
;; gosh> (16 9 4 1)

;; 理由
;; (1^2 . ())
;; => (2^2 . (1^2 . ()))
;; => (3^2 . (2^2 . (1^2 .())))
;; のように評価され、リストが作られていってしまうから

(define (square-list items)
  (define (square x)
    (* x x))
  (define (iter things answer)
    (if (null? things)
	answer
	(iter (cdr things)
	      (cons answer
		    (square (car things))))))
  (iter items ()))

(square-list (list 1 2 3 4))
;; gosh> ((((() . 1) . 4) . 9) . 16)

;; consがリストを返すのは第1引数が値で、
;; 第2引数がリストの場合


;; ではどうやったら期待通り動くのか
;; 値をリスト化してappendする
(define (square-list items)
  (define (square x)
    (* x x))
  (define (iter things answer)
    (if (null? things)
	answer
	(iter (cdr things)
	      (append answer
		      (list (square (car things)))))))
  (iter items ()))

(define (square-list2 items)
  (define (square x)
    (* x x))
  (define (iter things answer)
    (if (null? things)
	answer
	(iter (cdr things)
	      (cons (square (car things))
		    answer))))
  (iter items ()))

(square-list (list 1 2 3 4))
;; gosh> (1 4 9 16)

(reverse (square-list2 (list 1 2 3 4)))