#lang sicp

(#%require rackunit
           "accumulate.rkt")

(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (tree)
                     (if (pair? tree)
                         (count-leaves tree)
                         1))
                   t)))

(define tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(check-equal? (count-leaves tree) 7)