#lang sicp

(#%require rackunit
           "average.rkt"
           "point.rkt")

(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (midpoint-segment ab)
  (let ((ax (x-point (start-segment ab)))
        (ay (y-point (start-segment ab)))
        (bx (x-point (end-segment ab)))
        (by (y-point (end-segment ab))))
    (make-point (average ax bx)
                (average ay by))))

(#%provide make-segment
           start-segment
           end-segment
           midpoint-segment)