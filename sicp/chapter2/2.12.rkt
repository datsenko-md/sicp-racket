#lang sicp

(define (make-center-percent c p)
  (make-interval (* c (+ 1 p))
                 (* c (- 1 p))))

(define (percent i)
  (- (/ (upper-bound i) (center i)) 1))