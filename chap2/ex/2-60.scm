;; 問題2.60

;; elemet-of-set?は同じ定義のまま
;; intersection-setは同じ定義のまま
;; adjoin-setはconsを定義すれば良い(集合に要素を加える)
;; union-setはappendを定義すれば良い(２つの集合を結合する)

;; adjoin-setとunion-setはステップ数のオーダーはΘ(1)となり高速になる
;; 重複を許しているので空間効率は悪くなる

;; 応用は・・・うーん・・・