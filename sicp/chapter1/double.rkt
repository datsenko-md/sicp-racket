#lang sicp

(#%require rackunit)

(define (double x)
  (+ x x))

(#%provide double)

(check-equal? (double 2) 4)
