#lang sicp

(#%require "square.rkt")

(define (cont-frac-rec n d k)
  (define (rec i)
    (/ (n i)
       (- (d i)
          (if (= i k)
              0
              (rec (+ i 1))))))
  (rec 1))


(define (tan-cf x k)
  (define (n i)
    (if (= i 1)
        x
        (square x)))
  (define (d i)
    (- (* 2 i) 1))
  (cont-frac-rec n d k))

;(tan-cf 10.0 1000)