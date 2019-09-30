#lang sicp

(#%require rackunit
           "square.rkt"
           "map.rkt")

(define (square-list1 items)
  (if (null? items)
      nil
      (cons (square (car items))
            (square-list1 (cdr items)))))

(define (square-list2 items)
  (map (lambda (x)
         (* x x))
         items))

(check-equal? (square-list1 (list 1 2 3 4)) (list 1 4 9 16))
(check-equal? (square-list2 (list 1 2 3 4)) (list 1 4 9 16))