#lang sicp

(#%require rackunit)

(define (last-pair list)
  (let ((tail (cdr list)))
    (if (null? tail)
        list
        (last-pair tail))))

(check-equal? (last-pair (list 23 72 149 34)) (list 34))

(#%provide last-pair)