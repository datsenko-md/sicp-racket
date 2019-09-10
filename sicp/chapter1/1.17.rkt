#lang sicp

(#%require rackunit
           "double.rkt"
           "halve.rkt")

(define (* a b)
  (cond ((= b 0) 0)
        ((even? b) (double (* a (halve b))))
        (else (+ a (* a (- b 1))))))

(#%provide *)

(check-equal? (* 2 4) 8)
