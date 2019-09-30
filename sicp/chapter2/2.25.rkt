#lang sicp

(#%require rackunit)

(define list1 (list 1 3 (list 5 7) 9)); => (1 3 (5 7) 9)
(define list2 (list (list 7))); => ((7))
(define list3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7))))))); => (1 (2 (3 (4 (5 (6 7))))))

(check-equal? (car (cdr (car (cdr (cdr list1))))) 7)
(check-equal? (car (car list2)) 7)
(check-equal? (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr list3)))))))))))) 7)