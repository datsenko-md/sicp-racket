#lang sicp

(#%require rackunit)

(define (fold-right op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op (car rest)
                  result)
              (cdr rest))))
  (iter initial sequence))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(check-equal? (fold-right / 1.0 (list 1 2 3)) 1.5)
(check-equal? (fold-left / 1 (list 1 2 3)) (/ 1 6))

(#%provide fold-right
           fold-left)