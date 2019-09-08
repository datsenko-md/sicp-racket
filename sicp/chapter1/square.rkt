#lang sicp

(#%require rackunit)

(define (square x)
  (* x x))

(#%provide square)

(check-equal? (square 3) 9)