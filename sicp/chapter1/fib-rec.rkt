#lang sicp

(#%require rackunit)

(define (fib-rec n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib-rec (- n 1))
                 (fib-rec (- n 2))))))

(#%provide fib-rec)

(check-equal? (fib-rec 0) 0)
(check-equal? (fib-rec 1) 1)
(check-equal? (fib-rec 5) 5)
(check-equal? (fib-rec 10) 55)