#lang sicp

(define (compose f g)
  (lambda (x)
    (f (g x))))

(#%provide compose)