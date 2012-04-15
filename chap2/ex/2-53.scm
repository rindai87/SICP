;; 問題2.53

(list 'a 'b 'c)
;; gosh> (a b c)

(list (list 'george))
;; gosh> ((george))

(cdr '((x1 x2) (y1 y2)))
;; gosh> ((y1 y2))

(cadr '((x1 x2) (y1 y2)))
;; gosh> (y1 y2)

(pair? (car '(a short list)))
;; gosh> #f
(car '(a short list))
;; gosh> a

(memq 'red '((red shoes) (blue socks)))
;; gosh> #f

(memq 'red '(red shoes blue socks))
;; gosh> (red shoes blue socks)