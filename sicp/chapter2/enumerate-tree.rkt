#lang sicp

(#%require rackunit)

(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(check-equal? (enumerate-tree (list 1 (list 2 (list 3 4) (list 5)) (list 6 7))) (list 1 2 3 4 5 6 7))

(#%provide enumerate-tree)
