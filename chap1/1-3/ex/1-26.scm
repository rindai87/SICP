;; 問題1.26
(use slib)
(require 'trace)
(trace expmod)

;; Louiceのプログラム
(define (expmod base exp m)
  (cond [(= exp 0) 1]
	[(even? exp)
	 (remainder (* (expmod base (/ exp 2) m)
		       (expmod base (/ exp 2) m))
		    m)]
	[else
	 (remainder (* base (expmod base (- exp 1) m))
		    m)]))

;; gosh> (expmod 2 10 10)
;; CALL expmod 2 10 10
;;   CALL expmod 2 5 10
;;     CALL expmod 2 4 10
;;       CALL expmod 2 2 10
;;         CALL expmod 2 1 10
;;         RETN expmod 2
;;         CALL expmod 2 1 10
;;         RETN expmod 2
;;       RETN expmod 4
;;       CALL expmod 2 2 10
;;         CALL expmod 2 1 10
;;         RETN expmod 2
;;         CALL expmod 2 1 10
;;         RETN expmod 2
;;       RETN expmod 4
;;     RETN expmod 6
;;   RETN expmod 2
;;   CALL expmod 2 5 10
;;     CALL expmod 2 4 10
;;       CALL expmod 2 2 10
;;         CALL expmod 2 1 10
;;         RETN expmod 2
;;         CALL expmod 2 1 10
;;         RETN expmod 2
;;       RETN expmod 4
;;       CALL expmod 2 2 10
;;         CALL expmod 2 1 10
;;         RETN expmod 2
;;         CALL expmod 2 1 10
;;         RETN expmod 2
;;       RETN expmod 4
;;     RETN expmod 6
;;   RETN expmod 2
;; RETN expmod 4
;; 4

;; オリジナルのexpmod
(define (expmod base exp m)
  (define (square x)
    (* x x)) 
  (cond [(= exp 0) 1]
        [(even? exp)
         (remainder (square (expmod base (/ exp 2) m)) 
                    m)] 
        [else
         (remainder (* base (expmod base (- exp 1) m)) 
                    m)]))

;; gosh> (expmod 2 10 10)
;; CALL expmod 2 10 10
;;   CALL expmod 2 5 10
;;     CALL expmod 2 4 10
;;       CALL expmod 2 2 10
;;         CALL expmod 2 1 10
;;         RETN expmod 2
;;       RETN expmod 4
;;     RETN expmod 6
;;   RETN expmod 2
;; RETN expmod 4
;; 4

;; squareを使っていないため枝分かれが生じてしまい、
;; 結果として計算量がlog_nではなく、nとなってしまう。