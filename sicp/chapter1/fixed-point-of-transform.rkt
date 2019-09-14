#lang sicp

(#%require "fixed-point.rkt")

(define (fixed-point-of-transform f transform guess)
  (fixed-point (transform f) guess))

(#%provide fixed-point-of-transform)