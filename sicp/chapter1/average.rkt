#lang sicp

(#%require rackunit)

(define (average x y)
  (/ (+ x y) 2.0))

(#%provide average)

(check-equal? (average 4 5) 4.5)
