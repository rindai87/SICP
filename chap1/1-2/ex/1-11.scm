;; n < 3 に対してf(n) = n
;; n >= 3 に対してf(n) = f(n-1) + 2f(n-2) + 3f(n-3)
;; なる規則で定義するf

;; 再帰的プロセスの方法
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
	 (* 2 (f (- n 2)))
	 (* 3 (f (- n 3))))))

(f 3)
(f 4)
(f 5)
(f 10)

;; 反復的プロセスの方法
(define (f n)
  (f-iter 2 1 0 n)) 

(define (f-iter a b c count)
  (cond [(= count 0) c]
	[(= count 1) b] ;; ここはなくてもよい
	[(= count 2) a] ;; ここはなくてもよい
	[else (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))]))