#lang sicp

(#%require "repeated.rkt")

(define (smooth f)
  (define dx 0.00001)
  (lambda (x)
    (/ (+ (f (- x dx))
          (f x)
          (f (+ x dx)))
       3)))

(define (n-fold-smoothed f n)
  (lambda (x)
    ((repeated smooth n) x)))