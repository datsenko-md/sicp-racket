#lang sicp

(#%require rackunit
           "square.rkt")

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(#%provide expmod)

(check-equal? (expmod 3 4 5) 1)
(check-equal? (expmod 4 13 13) 4)
