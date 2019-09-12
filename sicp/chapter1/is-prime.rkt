#lang sicp

(#%require rackunit
           "smallest-divisor.rkt")

(define (prime? n)
  (= (smallest-divisor n) n))

(#%provide prime?)

(check-true (prime? 47))
(check-false (prime? 15))
