;;; 2.2.2 階層構造

(cons (list 1 2) (list 3 4))

;; length手続き(再帰版)
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

;; length手続き(反復版)
(define (length items)
  (define (iter l cnt)
    (if (null? l)
	cnt
	(iter (cdr l) (+ 1 cnt))))
  (iter items 0))


(define x (cons (list 1 2) (list 3 4)))

(length x)
;; gosh> 3


;; count-leaves手続き
(define (count-leaves x)
  (cond [(null? x) 0]
	[(not (pair? x)) 1]
	[else (+ (count-leaves (car x))
		 (count-leaves (cdr x)))]))

(count-leaves x)
;; gosh> 4

(list x x)
;; gosh> (#0=((1 2) 3 4) #0#)
(display (list x x))
;; gosh> (((1 2) 3 4) ((1 2) 3 4))#<undef>

(length (list x x))
;; gosh> 2

(count-leaves (list x x))
;; gosh> 8



;; 木の写像
(define (scale-tree tree factor)
  (define nil '())
  (cond [(null? tree) nil]
	[(not (pair? tree)) (* tree factor)]
	[else (cons (scale-tree (car tree) factor)
		    (scale-tree (cdr tree) factor))]))

(scale-tree (list 1 (list 2 (list 3 4) 5) (list 6 7))
	    10)
;; gosh> (10 (20 (30 40) 50) (60 70))


;; mapを利用するscale-tree
(define (scale-tree tree factor)
  (map (lambda (sub-tree) 
	 (if (pair? sub-tree)
	     (scale-tree sub-tree factor)
	     (* sub-tree factor)))
       tree))
(scale-tree (list 1 (list 2 (list 3 4) 5) (list 6 7))
	    10)
;; gosh> (10 (20 (30 40) 50) (60 70))