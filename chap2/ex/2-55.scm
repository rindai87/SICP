;; 問題2.55
(car ''abracadabra)
;;gosh> quote

(car (quote (quote abracadabra)))
;; gosh> quote

(car (quote (quote abracadabra)))
;;gosh> quote

(car (quote (list abracadabra)))
;; gosh> list