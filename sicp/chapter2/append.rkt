#lang sicp

(#%require rackunit)

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1)
            (append (cdr list1) list2))))

(define odds (list 1 3 5 7))
(define squares (list 1 4 9 16 25))

(check-equal? (append odds squares) (list 1 3 5 7 1 4 9 16 25))
(check-equal? (append squares odds) (list 1 4 9 16 25 1 3 5 7))