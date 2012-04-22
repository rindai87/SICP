;; 問題2.63

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
	      (cons (entry tree)
		    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
	result-list
	(copy-to-list (left-branch tree)
		      (cons (entry tree)
			    (copy-to-list (right-branch tree)
					  result-list)))))
  (copy-to-list tree '()))


(define (make-leaf entry)
  (make-tree entry '() '()))
(define tree1 (make-tree 7
                         (make-tree 3 (make-leaf 1) (make-leaf 5))
                         (make-tree 9 '() (make-leaf 11))))
(define tree2 (make-tree 3
                         (make-leaf 1)
                         (make-tree 7
                                    (make-leaf 5)
                                    (make-tree 9 '() (make-leaf 11)))))
(define tree3 (make-tree 5
                         (make-tree 3 (make-leaf 1) '())
                         (make-tree 9 (make-leaf 7) (make-leaf 11))))

tree1
;; gosh> (7 (3 (1 () ()) (5 () ())) (9 () (11 () ())))
(tree->list-1 tree1)
;; gosh> (1 3 5 7 9 11)
(tree->list-2 tree1)
;; gosh> (1 3 5 7 9 11)
;;....

;; a. 同じ結果を生じる
;; b
;; 1は再帰的手続きであり、appendを使っているのでステップ数の増加の程度ははO(n^2)である。
;; 2も再帰的手続きであるcopy-to-listが入れ子になっているので、反復的手続きではない)が、ステップ数の増加の程度はO(n)である。
