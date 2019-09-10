#lang sicp

(#%require rackunit
           "square.rkt")

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b
                 (fast-expt b (- n 1))))))

(#%provide fast-expt)

(check-equal? (fast-expt 2 4) 16)
