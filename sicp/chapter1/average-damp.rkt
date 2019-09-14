#lang sicp

(#%require "average.rkt"
           "fixed-point.rkt")

(define (average-damp f)
  (lambda (x) (average x (f x))))

(#%provide average-damp)