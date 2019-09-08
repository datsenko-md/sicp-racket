#lang sicp

(#%require rackunit
           "square.rkt")

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(#%provide sum-of-squares)

(check-equal? (sum-of-squares 3 4) 25)
