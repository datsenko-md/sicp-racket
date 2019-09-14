#lang sicp

(#%require "average.rkt")

(define (fixed-point f first-value)
  (define tolerance 0.00001)

  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

  (define (try guess)
    (let ((next (f guess)))
      (newline)
      (display guess)
      (if (close-enough? guess next)
          guess
          (try next))))

  (try first-value))


(define (find-x-exp-x) ; 34 шага
  (fixed-point (lambda (x) (/ (log 1000) (log x)))
                2.0))

(define (find-x-exp-x-damp) ; 9 шагов
  (fixed-point (lambda (x) (average x (/ (log 1000) (log x))))
               2.0))
