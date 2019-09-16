#lang sicp

(#%require rackunit
           "average.rkt")

(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (midpoint-segment ab)
  (let ((ax (x-point (start-segment ab)))
        (ay (y-point (start-segment ab)))
        (bx (x-point (end-segment ab)))
        (by (y-point (end-segment ab))))
    (make-point (average ax bx)
                (average ay by))))

(define a (make-point 3 4))
(define b (make-point 11 6))
(define ab (make-segment a b))
(define c (midpoint-segment ab))

(check-equal? (x-point c) 7.0)
(check-equal? (y-point c) 5.0)