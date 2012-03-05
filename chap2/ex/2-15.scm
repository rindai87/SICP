;; 問題2.15

(define R3 (make-center-percent 10 1))
(define R4 (make-center-percent 20 1))
(define R5 (make-center-percent 10 3))
(define R6 (make-center-percent 10 0.1))
(define R7 (make-center-percent 1000 50))

(define (check-percent x y)
  (percent (div-interval x y)))

;; 引き続いて振る舞いについての観察

;; 同一区間での除算の時の誤差
(check-percent R3 R3)
;; gosh> 1.9998000199979908

;; 誤差が同じで中央値が異なる時の誤差
(check-percent R4 R3)
;; gosh> 1.9998000199979908

;; 誤差の大きさが異なる時の誤差
(check-percent R5 R3)
;; gosh> 3.9988003598920248

;; 誤差が大きく異なるときの誤差
(check-percent R7 R6)
;; gosh> 50.07496251874062
;; 他の場合と比較して単純な誤差の和になっていない
;; 誤差の大きさが大きく異なる場合、小さい方の
;; 誤差の影響はほとんど無視出来るほど小さくなる
;; ことが予想される


;; 以上から、par1よりpar2のほうが「よい」プログラムであるというのは真である
;; なぜなら、par2は双方ともに区間を用いるのではなく、
;; 片方の区間を定数(誤差0)にすることで相対誤差の増加を抑えているためである