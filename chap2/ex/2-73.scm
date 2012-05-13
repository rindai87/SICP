;; 問題2.73

(define (deriv exp var)
  (cond ((number? exp) 0)
	((variable? exp) (if (same-variable? exp var) 1 0))
	(else ((get 'deriv (operator exp)) (operands exp)
	       var))))

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

;; a
;; number?、variable? は引数がリストでないために型を持たないから、データ主導の振り分けに組み込めない。

;; b
(define (install-sum-package)
  ;; 内部手続き
  (define (addend s) (car s))
  (define (augend s)
    (if (null? (cddr s))
        (cadr s)
        (cons '+ (cdr s))))
  (define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2)) (+ a1 a2))
          (else (list '+ a1 a2))))
  (define (deriv-sum exp var)
    (make-sum (deriv (addend exp) var)
              (deriv (augend exp) var)))
  ;; システムの他の部分とのインターフェース
  (put 'make '+ make-sum)
  (put 'deriv '+ deriv-sum)
  'done)

(define (install-product-package)
  ;; 内部手続き
  (define (multiplier p) (car p))
  (define (multiplicand p)
    (if (null? (cddr p))
        (cadr p)
        (cons '* (cdr p))))
  (define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2)) (* m1 m2))
          (else (list '* m1 m2))))
  (define (deriv-product exp var)
    ((get 'make '+)
      (make-product (multiplier exp)
                    (deriv (multiplicand exp) var))
      (make-product (deriv (multiplier exp) var)
                    (multiplicand exp))))
  ;; 他の部分とのインターフェース
  (put 'make '* make-product)
  (put 'deriv '* deriv-product)
  'done)

;; c
(define (install-exponent-package)
  ;; 内部手続き
  (define (base s) (car s))
  (define (exponent s) (cadr s))
  (define (make-exponentiation b e)
    (cond ((=number? e 0) 1)
          ((=number? e 1) b)
          (else (list '** b e))))
  (define (deriv-exponentation exp var)
    (let ((make-p (get 'make '*)))
         (make-p
           (make-p
             (exponent exp)
             (make-exponentiation (base exp) (- (exponent exp) 1)))
           (deriv (base exp) var))))
  ;; 他の部分とのインターフェース
  (put 'make '** make-exponentiation)
  (put 'deriv '** deriv-exponentation)
  'done)


;; d
;; 各手続きの put の引数の"演算"と"型"を逆転すればよい。

http://www.serendip.ws/archives/1006
http://d.hatena.ne.jp/tanakaBox/20071224/1198499001
http://d.hatena.ne.jp/awacio/20100905/1283698216