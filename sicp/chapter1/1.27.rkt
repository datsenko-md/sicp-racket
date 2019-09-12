#lang sicp

(#%require rackunit
           "square.rkt"
           "expmod.rkt")

(define (carmichael? n)
  (define (iter a)
    (cond ((= a n) true)
          ((fermat-test a n) (iter (+ a 1)))
          (else false)))
  (iter 1))

(define (fermat-test a n)
  (= (expmod a n n) a))

(#%provide carmichael?)

(check-true (carmichael? 561))
(check-true (carmichael? 1105))
(check-true (carmichael? 1729))
(check-true (carmichael? 2465))
(check-true (carmichael? 2821))
(check-true (carmichael? 6601))