;; 問題2.37

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define v (list 1 2 3))
(define w (list 4 5 6))

(dot-product v w)
;; gosh> 32
;; 1 * 4 + 2 * 5 + 3 * 6 = 4 + 10 + 18 = 32


(define m (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

(matrix-*-vector m v)
;; gosh> (14 32 50)
;; ((1*1+2*2+3*3) (4*1+5*2+6*3) (7*1+8*2+9*3))
;; =>(14 32 50)


(define (transpose mat)
  (accumulate-n cons nil mat))

(transpose m)
;; gosh> ((1 4 7) (2 5 8) (3 6 9))


(define n (list (list 3 2 1) (list 9 8 7) (list 6 4 5)))
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x)) m)))

(matrix-*-matrix m n)
;; gosh> ((39 30 30) (93 72 69) (147 114 108))  
