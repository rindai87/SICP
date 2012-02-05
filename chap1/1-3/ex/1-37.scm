;; 問題1.38
;; a. 連分数の近似、k項有限連分数近似の実装

;; 問題1.32で実装したaccumulation関数を流用できそう
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
		(accumulate combiner null-value term (next a) next b))))

(define (conf-frac n d k)
  (define (conf-frac-combiner i bunbo)
    (/ (n i) (+ (d i) bunbo)))
  (define (conf-frac-term i) i)
  (define (conf-frac-next i) (+ i 1))
  (accumulate conf-frac-combiner (/ (n k) (d k)) conf-frac-term 1 conf-frac-next (- k 1)))

;; 黄金比φ = 1.6180であるから
;; 1/φ = 0.61804...となる

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   9)
;; gosh> 0.6181818181818182

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   10)
;; gosh> 0.6179775280898876

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   11)
;; gosh> 0.6180555555555556

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   12)
;; gosh> 0.6180257510729613

;; 以上からkが11以上で4桁の精度の近似ができている


;; b. aを再帰的プロセスで実装したので、反復的プロセスで実装する
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (combiner result (term a)))))
  (iter a null-value))

;; 分母部分を先に計算して、その結果を元に分数を作りながら
;; k=1の方向に戻っていくイメージ
(define (cont-frac n d k)
  (define (conf-frac-combiner bunbo i)
    (/ (n i) (+ (d i) bunbo)))
  (define (conf-frac-term i) (+ (- k i) 1))
  (define (conf-frac-next i) (+ i 1))
  (accumulate conf-frac-combiner (/ (n k) (d k)) conf-frac-term 1 conf-frac-next (- k 1)))

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   9)
;; gosh> 0.6181818181818182

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   10)
;; gosh> 0.6179775280898876

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   11)
;; gosh> 0.6180555555555556

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   12)
;; gosh> 0.6180257510729613

;; 再帰版と同様の結果が得られることを確認した