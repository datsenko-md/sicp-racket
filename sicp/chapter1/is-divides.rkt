#lang sicp

(#%require rackunit)

(define (divides? n divisor)
  (= (remainder n divisor) 0))

(#%provide divides?)

(check-equal? (divides? 7 4) #f)
(check-equal? (divides? 8 4) #t)
