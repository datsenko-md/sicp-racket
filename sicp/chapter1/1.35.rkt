#lang sicp

(#%require "fixed-point.rkt")

(define golden-ratio
  (fixed-point (lambda (x) (+ 1 (/ 1 x)))
               1.0))

;golden-ratio
