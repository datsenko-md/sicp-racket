#lang sicp

(#%require rackunit
           "fermat-test.rkt")

(define (fast-prime? n times)
  (cond ((= 0 times) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(#%provide fast-prime?)

(check-true (fast-prime? 47 10))
(check-false (fast-prime? 15 10))