#lang sicp

(#%require rackunit)

(define (list-ref list n)
  (if (= n 0)
      (car list)
      (list-ref (cdr list) (- n 1))))

(define odds (list 1 3 5 7))

(check-equal? (list-ref odds 2) 5)
