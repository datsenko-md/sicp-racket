#lang sicp

(#%require rackunit
           "segment.rkt"
           "point.rkt")

(define (rect-area height width)
  (* height width))

(define (rect-perimeter height width)
  (* (+ height width) 2))

(define (make-rectangle upper-left-corner lower-right-corner)
  (cons upper-left-corner lower-right-corner))

(define (height rect)
  (let ((y-upper (y-point (start-segment rect)))
        (y-lower (y-point (end-segment rect))))
    (abs (- y-upper y-lower))))

(define (width rect)
  (let ((x-upper (x-point (start-segment rect)))
        (x-lower (x-point (end-segment rect))))
    (abs (- x-upper x-lower))))

(define ulc (make-point 2 6))
(define lrc (make-point 8 2))
(define rect (make-rectangle ulc lrc))
(define h (height rect))
(define w (width rect))
(define area (rect-area h w))
(define perimeter (rect-perimeter h w))

(check-equal? area 24)
(check-equal? perimeter 20)

(define (make-rectangle2 upper-left-corner height width)
  (cons upper-left-corner (cons height width)))

(define (height2 rect)
  (car (cdr rect)))

(define (width2 rect)
  (cdr (cdr rect)))

(define rect2 (make-rectangle2 ulc 4 6))
(define h2 (height2 rect2))
(define w2 (width2 rect2))
(define area2 (rect-area h2 w2))
(define perimeter2 (rect-perimeter h2 w2))

(check-equal? area2 24)
(check-equal? perimeter2 20)