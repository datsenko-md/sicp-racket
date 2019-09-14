#lang sicp

(#%require "newton-transform.rkt"
           "fixed-point.rkt")

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(#%provide newtons-method)

;(define (sqrt x)
;  (newtons-method (lambda (y) (- (* y y) x))
;                  1.0))
