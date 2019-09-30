#lang sicp

(#%require rackunit)

(define (reverse list)
  (define (iter list acc)
    (if (null? list)
        acc
        (iter (cdr list)
              (cons (car list) acc))))
  (iter list nil))

(check-equal? (reverse (list 1 2 3 4 5)) (list 5 4 3 2 1))

(#%provide reverse)