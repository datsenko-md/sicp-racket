#lang sicp

(#%require rackunit
           "folds.rkt")

(define (reverse sequence)
  (fold-right (lambda (x y) (cons x y)) nil sequence))

(define (reverse2 sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))

(check-equal? (reverse (list 1 2 3 4 5)) (list 5 4 3 2 1))
(check-equal? (reverse2 (list 1 2 3 4 5)) (list 5 4 3 2 1))
