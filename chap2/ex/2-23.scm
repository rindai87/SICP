;; 問題2.23

;; for-eachの実装
(define (for-eaach proc items)
  (cond [(null? items) #f]
	[else
	 (proc (car items))
	 (for-each proc (cdr items))]))

(for-each (lambda (x) (newline) (display x))
	  (list 57 321 88))

;; gosh> 
;; 57
;; 321
;; 88#<undef>

;; consで一つの式にしてしまい評価させてしまうという方法もある
(define (for-eaach proc items)
  (if (null? items)
      #f
      (cons (proc (car items)) (for-each proc (cdr items)))))

;; beginを利用してもよい
(define (for-eaach proc items)
  (if (null? items)
      #f
      (begin (proc (car items)) (for-each proc (cdr items)))))