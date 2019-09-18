#lang sicp

(#%require rackunit)

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

;(car (cons x y))
;(car (lambda (m) (m x y)))
;((lambda (m) (m x y)) (lambda (p q) p))
;((lambda (p q) p) x y)
;((x y) x)
;x

(define (cdr z)
  (z (lambda (p q) q)))

(define a (cons 1 2))
(check-equal? (car a) 1)
(check-equal? (cdr a) 2)