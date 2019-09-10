#lang sicp

(#%require rackunit)

(define (expt-r b n)
  (if (= n 0)
      1
      (* b
         (expt-r b
                 (- n 1)))))

(#%provide expt-r)

(check-equal? (expt-r 2 4) 16)
