#lang sicp

(#%require rackunit
           "smallest-divisor.rkt")

(define (is-prime n)
  (= (smallest-divisor n) n))

(#%provide is-prime)

(check-true (is-prime 47))
(check-false (is-prime 15))
