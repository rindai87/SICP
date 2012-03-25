;; 問題2.27

(define x (list (list 1 2) (list 3 4)))

;; reverseはgauche組み込みであるけど、念のために
(define (reverse-new items)
  (define (reverse-iter rev-items items)
    (if (null? items)
	rev-items
	(reverse-iter (cons (car items) rev-items) (cdr items))))
  (reverse-iter () items))

(reverse-new (list 1 2 3 4))

;; 最初に思いついた回答
;; 対なら(cdr, car)でくっつけて再帰的にたどっていく
(define (deep-reverse items)
  (if (pair? items)
      (append (deep-reverse (cdr items))
              (list (deep-reverse (car items))))
      items))

(deep-reverse x)

;; mapを使う
;; 葉まで分解し、再構築してreverseしながらくっつけていく
(define (deep-reverse items)
   (if (not (pair? items))
      items
      (reverse (map deep-reverse items))))

x
;; gosh> ((1 2) (3 4))

(reverse x)
;; gosh> ((3 4) (1 2))

(deep-reverse x)
;; gosh> ((4 3) (2 1))
