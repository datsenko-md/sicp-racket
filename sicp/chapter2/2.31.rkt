#lang sicp

(#%require rackunit
           "square.rkt")

(define (tree-map proc tree)
  (map (lambda (sub-tree)
         (if (null? sub-tree)
             nil
             (if (pair? sub-tree)
                 (tree-map proc sub-tree)
                 (proc sub-tree))))
       tree))

(define (tree-map2 proc tree)
  (if (null? tree)
      nil
      (if (pair? tree)
          (cons (tree-map2 proc (car tree))
                (tree-map2 proc (cdr tree)))
          (proc tree))))

(define (square-tree tree)
  (tree-map square tree))

(define (square-tree2 tree)
  (tree-map2 square tree))

(check-equal? (square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
              (list 1 (list 4 (list 9 16) 25) (list 36 49)))

(check-equal? (square-tree2 (list 1 (list 2 (list 3 4) 5) (list 6 7)))
              (list 1 (list 4 (list 9 16) 25) (list 36 49)))
