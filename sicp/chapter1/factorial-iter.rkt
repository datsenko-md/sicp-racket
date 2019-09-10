#lang sicp

(#%require rackunit)

(define (factorial-iter n)
  (define (fact-iter product counter max-count)
    (if (> counter max-count)
        product
        (fact-iter (* product counter)
                   (+ counter 1)
                   max-count)))
  (fact-iter 1 1 n))

(#%provide factorial-iter)

(check-equal? (factorial-iter 6) 720)