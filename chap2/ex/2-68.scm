;; 問題2.68

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
	      (encode (cdr message) tree))))

(define (element-of-set? symbol symbols)
  (cond ((null? symbols) #f)
	((eq? symbol (car symbols)) #t)
	(else (element-of-set? symbol (cdr symbols)))))

(define (encode-symbol symbol tree)
  (if (leaf? tree)
      '()
      (cond ((element-of-set? symbol (symbols (left-branch tree)))
	     (cons 0 (encode-symbol symbol (left-branch tree))))
	    ((element-of-set? symbol (symbols (right-branch tree)))
	     (cons 1 (encode-symbol symbol (right-branch tree))))
	    (else (error "bad symbol -- ENCODE-SYMBOL" symbol)))))


(encode (decode sample-message sample-tree) sample-tree)
;; gosh> (0 1 1 0 0 1 0 1 0 1 1 1 0)