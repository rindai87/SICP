;; 問題2.64

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
	(let ((left-result (partial-tree elts left-size)))
	  (let ((left-tree (car left-result))
		(non-left-elts (cdr left-result))
		(right-size (- n (+ left-size 1))))
	    (let ((this-entry (car non-left-elts))
		  (right-result (partial-tree (cdr non-left-elts)
					      right-size)))
	      (let ((right-tree (car right-result))
		    (remaining-elts (cdr right-result)))
		(cons (make-tree this-entry left-tree right-tree)
		      remaining-elts))))))))


;; a. 真ん中と左右に分割。左右をまた分割。...を繰り返して最後にmake-tree
;; b. Θ(n)

;; http://d.hatena.ne.jp/tanakaBox/20071217/1197874683
;; http://d.hatena.ne.jp/nagayoru/20110820/1313790209
;; http://sicp.g.hatena.ne.jp/n-oohira/20090328/1238252584
;; http://d.hatena.ne.jp/unlearned/20091103/1257258458