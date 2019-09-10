#lang sicp

(#%require rackunit
           "double.rkt"
           "halve.rkt")

(define (* a b)
  (define (iter a b x)
    (cond ((= b 0) x)
          ((even? b) (iter (double a)
                           (halve b)
                           x))
          (else (iter a
                      (- b 1)
                      (+ x a)))))
  (iter a b 0))

(#%provide *)

(check-equal? (* 2 4) 8)
