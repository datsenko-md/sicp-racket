#lang sicp

(#%require rackunit)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(check-equal? (accumulate + 0 (list 1 2 3 4 5)) 15)

(#%provide accumulate)