#lang sicp

(#%require "deriv.rkt")

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x)
            ((deriv g) x)))))

(#%provide newton-transform)
