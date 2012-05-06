;; 問題2.66

;; 順序付けられたキーの比較をする
;; 等しい：レコードの値を返す
;; 小さい：左側の木で再帰
;; 大きい：右側の木で再帰

(define (lookup key tree)
  (cond ((null? tree) #f)
	((equal? key (get-key (car tree)))
	 (car tree))
	((< key (get-key (car tree)))
	 (lookup key (left-branch tree)))
	((> key (get-key (car tree)))
	 (lookup key (right-branch tree)))))

(define (get-key record)
  (car record))