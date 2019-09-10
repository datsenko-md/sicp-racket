#lang sicp

(#%require rackunit)

(define (expt-i b n)
  (define (iter b count product)
    (if (= count 0)
        product
        (iter b
              (- count 1)
              (* b product))))
  (iter b n 1))

(#%provide expt-i)

(check-equal? (expt-i 2 4) 16)
