#lang sicp

(#%require rackunit
           "square.rkt")

(define (fast-expt b n)
  (define (iter a b n)
    (cond ((= n 0) a)
          ((even? n) (iter a
                           (square b)
                           (/ n 2)))
          (else (iter (* a b)
                      b
                      (- n 1)))))
  (iter 1 b n))

(#%provide fast-expt)

(check-equal? (fast-expt 2 4) 16)
