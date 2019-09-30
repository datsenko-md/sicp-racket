#lang sicp

(#%require rackunit)

(define (last-pair list)
  (let ((tail (cdr list)))
    (if (null? tail)
        list
        (last-pair tail))))

;(define (last-pair list)
;  (if (null? (cdr list))
;      list
;      (last-pair (cdr list))))

;(define (last-pair list)
;  (let ((last-element (list-ref list
;                                (- (length list) 1))))
;    (cons last-element
;          nil)))

;(define (last-pair list)
;  (cons (list-ref list
;                  (- (length list) 1))
;        nil))

(check-equal? (last-pair (list 23 72 149 34)) (list 34))
