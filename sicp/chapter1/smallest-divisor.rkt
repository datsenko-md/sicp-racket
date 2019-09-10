#lang sicp

(#%require rackunit
           "is-divides.rkt")

(define (smallest-divisor n)
  (define (iter divisor n)
    (cond ((= divisor n) n)
          ((divides? n divisor) divisor)
          (else (iter (+ divisor 1)
                      n))))
  (iter 2 n))

(#%provide smallest-divisor)

(check-equal? (smallest-divisor 47) 47)
(check-equal? (smallest-divisor 15) 3)
