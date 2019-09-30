#lang sicp

(#%require rackunit)

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

(check-equal? (count-leaves (cons (list 1 2) (list 3 4))) 4)

(#%provide count-leaves)