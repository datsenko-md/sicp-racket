#lang sicp

(#%require "average.rkt")

(define (fixed-point f first-value)
  (define tolerance 0.00001)
  
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          guess
          (try next))))
  (try first-value))

;(fixed-point cos 1.0)
;(fixed-point (lambda (y) (+ (sin y) (cos y)))
;             1.0)
;(define (sqrt x)
;  (fixed-point (lambda (y) (average y (/ x y)))
;               1.0))
;(sqrt 2.0)

(#%provide fixed-point)