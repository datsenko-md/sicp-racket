#lang sicp

(#%require "square.rkt"
           "average.rkt")

(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (define (iter guess)
      (if (good-enough? guess)
          guess
          (iter (improve guess))))
    (iter guess)))

(define (sqrt x)
  (define (good-enough? guess)
    (let ((tolerance 0.0001))
      (< (abs (- (square guess) x)) tolerance)))
  (define (improve guess)
    (average (/ x guess) guess))
  ((iterative-improve good-enough? improve) 1.0))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (let ((tolerance 0.0001))
      (< (abs (- v1 v2)) tolerance)))
  (define (good-enough? guess)
    (let ((next (f guess)))
      (close-enough? guess next)))
  (define (improve guess)
    (f guess))
  ((iterative-improve good-enough? improve) first-guess))
               
        