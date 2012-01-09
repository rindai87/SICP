;; 問題1.15
(define (cube x)
  (* x x x))

(define (p x)
  (- (* 3 x)
     (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(use slib)
(require 'trace)
(trace sine)
(trace p)

(sine 12.15)

;; a. 手続きpが何回作用させられたか
;; 5回
;;gosh> CALL sine 12.15
;;  CALL sine 4.05
;;    CALL sine 1.3499999999999999
;;      CALL sine 0.44999999999999996
;;        CALL sine 0.15
;;          CALL p 0.049999999999999996
;;          RETN p 0.1495
;;        RETN sine 0.1495
;;        CALL p 0.1495
;;        RETN p 0.4351345505
;;      RETN sine 0.4351345505
;;      CALL p 0.4351345505
;;      RETN p 0.9758465331678772
;;    RETN sine 0.9758465331678772
;;    CALL p 0.9758465331678772
;;    RETN p -0.7895631144708228
;;  RETN sine -0.7895631144708228
;;  CALL p -0.7895631144708228
;;  RETN p -0.39980345741334
;;RETN sine -0.39980345741334
;;-0.39980345741334

;; b. (sine a)の増加の程度の見積もり