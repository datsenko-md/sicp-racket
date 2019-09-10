#lang sicp

(#%require rackunit
           "expmod.rkt")

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(#%provide fermat-test)

(check-true (fermat-test 13))
(check-false (fermat-test 50))
