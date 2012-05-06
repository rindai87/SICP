;; 問題2.70

(define tree-2.70 (generate-huffman-tree '((A 2) (NA 16) (BOOM 1) (SHA 3) (GET 2) (YIP 9) (JOB 2) (WAH 1))))

(define message-2.70
  '(GET A JOB SHA NA NA NA NA NA NA NA NA
	GET A JOB SHA NA NA NA NA NA NA NA NA
	WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP
	SHA BOOM))

(encode message-2.70 tree-2.70)
;; gosh> (1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 1 0 1 1)

(decode (encode message-2.70 tree-2.70) tree-2.70)
;; gosh> (GET A JOB SHA NA NA NA NA NA NA NA NA GET A JOB SHA NA NA NA NA NA NA NA NA WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP SHA BOOM)

;; 符号化に必要なbit数
(length (encode message-2.70 tree-2.70))
;; gosh> 84
;; 84ビット

(length message-2.70)
;; gosh> 36
;; 固定長符号を使う場合、messageの種類が8種類なので、3bit(2^3=8)必要
;; messageの長さが36なので
;; 36×3 = 108ビット必要

;; 可変長の方がbit数を節約できている。