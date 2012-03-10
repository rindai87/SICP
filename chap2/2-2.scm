;;;;;;;;;;;;;
; 2.2.1 並びの表現
; 全体の並びは入れ子になったcons演算で構成される
(cons 1
      (cons 2
	    (cons 3
		  (cons 4 ()))))

(list 1 2 3 4)

(define one-through-four (list 1 2 3 4))
one-through-four
;; gosh> (1 2 3 4)

(car one-through-four)
;; gosh> 1

(cdr one-through-four)
;; gosh> (2 3 4)

(car (cdr one-through-four))
;; gosh> 2

(cons 10 one-through-four)
;; gosh> (10 1 2 3 4)

(cons 5 one-through-four)
;; gosh> (5 1 2 3 4)


;;;;;;;;;;;
;; リスト演算

;; 引数としてリストと数値nをとり、
;; リストのn番目(0からスタート)
;; を返す
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(define squares (list 14 9 16 25))

(list-ref squares 3)
;; gosh> 25


;; リストの仲にある項の個数を
;; 返す手続き
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(length squares)
;; gosh> 4


;; 反復のlength
(define (length items)
  (define (length-iter a count)
    (if (null? a)
	count
	(length-iter (cdr a) (+ 1 count))))
  (length-iter items 0))

(length squares)
;; gosh> 4

(define odds (list 1 3 5 7))

;; consアップ
(append squares odds)
;; gosh> (14 9 16 25 1 3 5 7)
(append odds squares)
;; gosh> (1 3 5 7 14 9 16 25)

;; append
(define (append-new list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))


;; リストの写像
(define (scale-list items factor)
  (if (null? items)
      ()
      (cons (* (car items) factor)
	    (scale-list (cdr items) factor))))
(scale-list (list 1 2 3 4 5) 10)
;; gosh> (10 20 30 40 50)

(define (map-new proc items)
  (if (null? items)
      ()
      (cons (proc (car items))
	    (map-new proc (cdr items)))))

(map-new abs (list -10 2.5 -11.6 17))
;; gosh> (10 2.5 11.6 17)

(map-new (lambda (x) (* x x)) (list 1 2 3 4 5))
;; gosh> (1 4 9 16 25)

;; scale-listをmapを用いて再定義
(define (scale-list2 items factor)
  (map-new (lambda (x) (* x factor) items))
(scale-list2 (list 1 2 3 4 5) 10)
;; gosh> (10 20 30 40 50)