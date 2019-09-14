#lang sicp

(#%require "fixed-point-of-transform.rkt"
           "average-damp.rkt"
           "repeated.rkt")

(define (number-of-damp n)
  (floor (/ (log n) (log 2))))

(define (nth-root-of x n)
  (fixed-point-of-transform (lambda (y) (/ x (expt y (- n 1))))
                            (repeated average-damp (number-of-damp n))
                            1.0))


    