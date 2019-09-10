#lang sicp

(#%require rackunit)

(define (halve x)
  (/ x 2))

(#%provide halve)

(check-equal? (halve 4) 2)
