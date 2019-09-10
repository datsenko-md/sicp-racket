#lang sicp

(#%require rackunit)

(define (fib-iter n)
  (define (iter a b count)
    (if (= count 0)
          b
          (iter (+ a b)
                a
                (- count 1))))
  (iter 1 0 n))

(#%provide fib-iter)

(check-equal? (fib-iter 0) 0)
(check-equal? (fib-iter 1) 1)
(check-equal? (fib-iter 5) 5)
(check-equal? (fib-iter 10) 55)