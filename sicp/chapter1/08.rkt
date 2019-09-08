#lang sicp

(#%require rackunit
           "cube.rkt"
           "square.rkt"
           "average.rkt")

(define (cube-root x)
  (cube-root-iter 1.0 x))

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs ( - (/ (cube guess) x) 1)) 0.001))

(define (improve guess x)
  (/ (+ (/ x
           (square guess))
        (* 2 guess))
     3))

(#%provide cube-root)

(check-true (< (abs(- (cube-root 27) 3)) 0.00001))