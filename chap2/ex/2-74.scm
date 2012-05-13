;; 問題2.74

; 事業所レコードの構造（東京事業所）
(type-tag (record1) (record2) ...)
(tokyo (isono nakano1-2 150000) (nakajima setagaya2-1 250000) ...)

; 従業員レコードの構造（東京事業所）
(name address salary)
(isono nakano1-2 150000)
(nakajima setagaya2-1 250000)

(define (install-tokyo-company-package)
  ;; 内部手続き
  (define (make-employee-record name address salary)
    (list name address salary))
  (define (make-company-record record-list)
    (cons 'tokyo record-list))
  (define (name record) (car record))
  (define (address record) (cadr record))
  (define (salary record) (caddr record))
  (define (get-record company-record employee-name)
    (let ((records (cdr company-record)))
         (define (get-rcd records)
           (if (null? records)
               #f
               (let ((record (car records)))
                    (cond ((equal? employee-name (name record)) record)
                          (else (get-rcd (cdr records)))))))
         (get-rcd records)))
  ;; 外部とのインターフェース
  (put 'get-name 'tokyo name)
  (put 'get-address 'tokyo address)
  (put 'get-salary 'tokyo salary)
  (put 'make-employee-record 'tokyo make-employee-record)
  (put 'make-company-record 'tokyo make-company-record)
  (put 'get-record 'tokyo get-record)
  'done)

(install-tokyo-company-package)

(define (make-tokyo-employee-record name address salary)
  ((get 'make-employee-record 'tokyo) name address salary))

(define tokyo-db
  ((get 'make-company-record 'tokyo)
   (list
     (make-tokyo-employee-record 'isono 'nakano1-2 150000)
     (make-tokyo-employee-record 'nakajima 'setagaya2-1 250000))))

;; a
(define (get-record company-record name)
  ((get 'get-record (type-tag company-record)) company-record name))

;; b
(define (get-salary company-record name)
  (let ((employee-record (get-record company-record name)))
       (if employee-record
           ((get 'get-salary (type-tag company-record)) employee-record)
           (error "Not found data -- GET-SALARY: " name))))

;; c
; 事業所レコードの構造（大阪事業所）
(type-tag (address phone) (record1) (record2) ...)
(osaka ('nakanoshima2-1 06-5524-88xx) (fuguta 200000 kitaku2-1) (hanazawa 180000 sakai3-2) ...)

; 従業員レコードの構造（大阪事業所）
(name salary address)
(fuguta 200000 kitaku2-1)
(hanazawa 180000 sakai3-2)

(define (install-osaka-company-package)
  ;; 内部手続き
  (define (make-employee-record name salary address)
    (list name salary address))
  (define (make-company-record company-address phone record-list)
    (cons 'osaka (cons '(company-address phone) record-list)))
  (define (name record) (car record))
  (define (salary record) (cadr record))
  (define (address record) (caddr record))
  (define (get-record company-record employee-name)
    (let ((records (cdr company-record)))
         (define (get-rcd records)
           (if (null? records)
               #f
               (let ((record (car records)))
                    (cond ((equal? employee-name (name record)) record)
                          (else (get-rcd (cdr records)))))))
         (get-rcd records)))
  ;; 外部とのインターフェース
  (put 'get-name 'osaka name)
  (put 'get-salary 'osaka salary)
  (put 'get-address 'osaka address)
  (put 'make-employee-record 'osaka make-employee-record)
  (put 'make-company-record 'osaka make-company-record)
  (put 'get-record 'osaka get-record)
  'done)

(install-osaka-company-package)

(define (make-osaka-employee-recode name salary address)
  ((get 'make-employee-record 'osaka) name salary address))

(define osaka-db
  ((get 'make-company-record 'osaka) 'nakanoshima2-1 '06-5524-88xx
   (list (make-osaka-employee-recode 'fuguta 200000 'kitaku2-1)
         (make-osaka-employee-recode 'hanazawa 180000 'sakai3-2))))

(define (find-employee-record whole-record-list name)
  (if (null? whole-record-list)
      (error "Record not Found. -- FIND-EMPLOYEE-RECORD: " name)
      (let ((record-list (car whole-record-list)))
           (let ((record ((get 'get-record (type-tag record-list)) record-list name)))
                (if record
                    record
                    (find-employee-record (cdr whole-record-list) name))))))

(define wrl (list tokyo-db osaka-db))


;; d
;; 今ある事業所のタイプタグの一段階上にさらに抽象レイヤーを作る。
;; つまり、会社のタイプタグなどを作り、「それぞれの会社のすべての事業所ファイルの集合」への型付けを行う。
;; そしてfind-employee-recordなどの基本手続きをそのレイヤーの上に接続するように変更する。

http://d.hatena.ne.jp/awacio/20100907/1283868117
http://d.hatena.ne.jp/nagayoru/20110820/1313790219
http://d.hatena.ne.jp/tmurata/20090722/1248220539
http://www.serendip.ws/archives/1019