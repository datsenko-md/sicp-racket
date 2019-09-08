#lang sicp

(#%require rackunit
           "sum-of-squares.rkt")

(define (sum-of-squares-ot-two-lagrest x y z)
  (cond ((and (< x y) (< x z)) (sum-of-squares y z))
        ((and (< y x) (< y z)) (sum-of-squares x z))
        (else (sum-of-squares x y))))

(#%provide sum-of-squares-ot-two-lagrest)

(check-equal? (sum-of-squares-ot-two-lagrest 3 2 4) 25)
(check-equal? (sum-of-squares-ot-two-lagrest 0 -2 4) 16)