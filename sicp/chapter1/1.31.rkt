#lang sicp

(#%require rackunit)

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (factorial n)
  (product identity 1 inc n))

(define (appr-pi n)
  (define (term x)
    (if (even? x)
        (/ (+ x 2) (+ x 3))
        (/ (+ x 3) (+ x 2))))
  
  (* (product2 term 0 inc n)
     4.0))

(define (product2 term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(check-equal? (factorial 6) 720)

;(appr-pi 100)
