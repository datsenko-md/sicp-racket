#lang sicp

(#%require rackunit
           "square.rkt"
           "average.rkt")

(define (my-sqrt x)
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))

  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))

  (define (improve guess)
    (average (/ x guess) guess))

  (sqrt-iter 1.0))

(#%provide my-sqrt)
(check-true (< (abs(- (sqrt 2) (my-sqrt 2))) 0.001))

;> (sqrt 0.0000002)
;0.00044721359549995795
;> (my-sqrt 0.0000002)
;0.031252131221015556