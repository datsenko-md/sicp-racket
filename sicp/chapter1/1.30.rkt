#lang sicp

(#%require rackunit)

(define (sum a term next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

(define (sum-integers a b)
  (sum a identity inc b))

(check-equal? (sum-integers 1 10) 55)
