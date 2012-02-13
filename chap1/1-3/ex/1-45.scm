;; 問題1.45

;; n乗根をm回の平均緩和を使って解いて収束を見る実験

(define (n-fold-average-damp n) 
  (repeated average-damp n))

(define (n-root-exp n x m)
  (fixed-point ((n-fold-average-damp m)
                (lambda (y) (/ x (expt y (- n 1)))))
               1.0))

(n-root-exp 2 2 0) ;; ☓
(n-root-exp 2 2 1)
(n-root-exp 3 2 1)
(n-root-exp 4 2 1) ;; ☓
(n-root-exp 4 2 2)
(n-root-exp 5 2 2)
(n-root-exp 6 2 2)
(n-root-exp 7 2 2)
(n-root-exp 8 2 2) ;; ☓
(n-root-exp 8 2 3)

;; ここから、必要なm回は、n = 2^iとしたときの、
;; i以下の最も大きな整数
;; と推測できる

(define (n-root n x)
  (define (damp-count m)
    (if (< m 2)
        0
        (+ 1 (damp-count (/ m 2)))))
  (fixed-point ((n-fold-average-dump (damp-count n))
                (lambda (y) (/ x (expt y (- n 1)))))))