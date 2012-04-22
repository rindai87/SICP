;; 問題2.65

;; treeをリストに変換してから処理
;; 最後にtreeを再構築
;; これでいいのだろうか・・・

(define (union-tree tree1 tree2)
  (let ((list1 (tree->list-2 tree1))
        (list2 (tree->list-2 tree2)))
    (list->tree (union-set list1 list2))))

(define (intersection-tree tree1 tree2)
  (let ((list1 (tree->list-2 tree1))
        (list2 (tree->list-2 tree2)))
    (list->tree (intersection-set list1 list2))))