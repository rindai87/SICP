;; 問題2.29

;; 2進モービルを二つの枝からできている
;; 合成データで表現
(define (make-mobile left right)
  (list left right))

;; 一つの枝はlength(数でなければならない)と,
;; 数か別のモービルであるstructureで
;; 構成する
(define (make-branch length structure)
  (list length structure))

;; a.
;; モービルの枝を返す手続き
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

;; 枝の部品を返す手続き
(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

;; aの確認
(define mobile1 (make-mobile (make-branch 1 2)
			     (make-branch 3 4)))

(define mobile2 (make-mobile (make-branch 6 2)
			     (make-branch 1 (make-mobile (make-branch 2 4)
							 (make-branch 1 8)))))
(print mobile1)
;; gosh> ((1 2) (3 4))

(left-branch mobile1)
;; gosh> (1 2)

(right-branch mobile1)
;; gosh> (3 4)

(branch-length (left-branch mobile1))
;; gosh> 1

(branch-structure (left-branch mobile1))
;; gosh> 2


;; b.
;; aで定義した選択肢を使って, モービルの全重量を
;; 返す手続きtotal-weightを定義する

;; mobileを与えて全重量を求めるtotal-weight
(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(define (branch-weight branch)
  (if (number? (branch-structure branch))
      (branch-structure branch)
      (total-weight (branch-structure branch))))

(display mobile1)
;; gosh> ((1 2) (3 4))

(total-weight mobile1)
;; gosh> 6
;; 2 + 4 = 6

(display mobile2)
;; gosh> ((6 2) (1 ((2 4) (1 8))))

(total-weight mobile2)
;; gosh> 14
;; 2 + 4 + 8 = 14

;; c.
;; 二進モービルが釣り合っているか釣り合ってるかどうかのテスト
;; 回転力:長さ×重さ

;; 方針
;; 最上段で左右の枝が釣り合っているか調べる
;; 釣り合っていたら、再帰的に双方の枝が釣り合っているか調べる
;; 釣り合っていない枝が見つかったら終了

(define (balanced? mobile)
  (let ((left-moment (* (branch-length (left-branch mobile))
			(branch-weight (left-branch mobile))))
	(right-moment (* (branch-length (right-branch mobile))
			 (branch-weight (right-branch mobile)))))
    (if (= left-moment right-moment)
	(and (balanced-branch? (left-branch mobile))
	     (balanced-branch? (right-branch mobile)))
	#f)))

(define (balanced-branch? branch)
  (if (number? (branch-structure branch))
      #t
      (balanced? (branch-structure branch))))


;; 検証1.バランスがとれている
(define mobile3 (make-mobile (make-branch 1 2)
			     (make-branch 1 2)))
(balanced? mobile3)
;; gosh> #t

;; 検証2. ちょっと複雑だがバランスがとれている
(define mobile4 (make-mobile (make-branch 1
					  (make-mobile (make-branch 2 3)
						       (make-branch 3 2)))
			     (make-branch 1
					  (make-mobile (make-branch 3 2)
						       (make-branch 2 3)))))
(balanced? mobile4)

;; 検証3. ちょっと複雑だがバランスがとれていない
(define mobile5 (make-mobile (make-branch 3
					  (make-mobile (make-branch 6 3)
						       (make-branch 3 6)))
			     (make-branch 7 7)))
(balanced? mobile5)
;; gosh> #f

;; 検証4. 最上段はバランスがとれている。枝にぶら下がっているモービルでバランスがとれていない
(define mobile6 (make-mobile (make-branch 5
					  (make-mobile (make-branch 3 2)
						       (make-branch 3 4)))
			     (make-branch 5 6)))
(balanced? mobile6)



;; d.
;; make-mobile, make-branchの実装が変わった時の対応

(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define mobile3 (make-mobile (make-branch 1 2)
			     (make-branch 1 2)))

(define mobile4 (make-mobile (make-branch 1
					  (make-mobile (make-branch 2 3)
						       (make-branch 3 2)))
			     (make-branch 1
					  (make-mobile (make-branch 3 2)
						       (make-branch 2 3)))))

;; 検証用
(display mobile3)
(left-branch mobile3)
(right-branch mobile3)
(branch-length (left-branch mobile3))
(branch-weight (left-branch mobile3))
(branch-length (right-branch mobile3))
(branch-weight (right-branch mobile3))
(total-weight mobile3)
(balanced? mobile3)

(display mobile4)
(left-branch mobile4)
(right-branch mobile4)
(branch-length (left-branch mobile4))
(branch-weight (left-branch mobile4))
(branch-length (right-branch mobile4))
(branch-weight (right-branch mobile4))
(total-weight mobile4)
(balanced? mobile4)


;; consとlistに対してcarとcdrを適用した時の結果を確認
(car (cons (cons 1 2) (cons 1 2)))
(car (list (list 1 2) (list 1 2)))

(cdr (cons (cons 1 2) (cons 1 2)))
(cdr (list (list 1 2) (list 1 2)))

;; P55図2.2とP56図2.4を見ればconsとlistの
;; データ構造の違いが理解できる

;; cadrを使っている手続きを修正する
;; right-branch, branch-structure
(define (right-branch mobile)
  (cdr mobile))

(define (branch-structure branch)
  (cdr branch))

;; 検証用
(display mobile3)
(left-branch mobile3)
(right-branch mobile3)
(branch-length (left-branch mobile3))
(branch-weight (left-branch mobile3))
(branch-length (right-branch mobile3))
(branch-weight (right-branch mobile3))
(total-weight mobile3)
(balanced? mobile3)

(display mobile4)
(left-branch mobile4)
(right-branch mobile4)
(branch-length (left-branch mobile4))
(branch-weight (left-branch mobile4))
(branch-length (right-branch mobile4))
(branch-weight (right-branch mobile4))
(total-weight mobile4)
(balanced? mobile4)
