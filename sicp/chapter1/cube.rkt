#lang sicp

(#%require rackunit)

(define (cube x)
  (* x x x))

(#%provide cube)

(check-equal? (cube 3) 27)
