#lang sicp

(#%require rackunit
           "square.rkt"
           "accumulate.rkt")

(define (map p sequence)
  (accumulate (lambda (x y)
                (cons (p x)
                      y))
              nil
              sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (x y)
                (+ 1 y))
              0
              sequence))

(check-equal? (map square (list 1 2 3 4 5)) (list 1 4 9 16 25))
(check-equal? (append (list 1 2 3) (list 4 5 6)) (list 1 2 3 4 5 6))
(check-equal? (length (list 1 2 3 4 5)) 5)