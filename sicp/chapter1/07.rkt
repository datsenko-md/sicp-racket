#lang sicp

(#%require rackunit
           "square.rkt"
           "average.rkt")

(define (good-enough? guess x)
  (< (abs ( - (/ (square guess) x) 1)) 0.001))

(define (improve guess x)
  (average (/ x guess) guess))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (my-sqrt x)
  (sqrt-iter 1.0 x))

(#%provide my-sqrt)

(check-true (< (abs(- (sqrt 2) (my-sqrt 2))) 0.00001))

;> (sqrt 0.0000002)
;0.00044721359549995795
;> (my-sqrt 0.0000002)
;0.00044721398210299367