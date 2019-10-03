#lang sicp

(#%require rackunit)

(define (square-tree tree)
  (map (lambda (sub-tree)
         (if (null? sub-tree)
             nil
             (if (pair? sub-tree)
                 (square-tree sub-tree)
                 (* sub-tree sub-tree))))
       tree))

(define (square-tree2 tree)
  (if (null? tree)
      nil
      (if (pair? tree)
          (cons (square-tree2 (car tree))
                (square-tree2 (cdr tree)))
          (* tree tree))))

(check-equal? (square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
              (list 1 (list 4 (list 9 16) 25) (list 36 49)))

(check-equal? (square-tree2 (list 1 (list 2 (list 3 4) 5) (list 6 7)))
              (list 1 (list 4 (list 9 16) 25) (list 36 49)))