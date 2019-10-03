#lang sicp

(#%require rackunit)

(define (scale-tree tree factor)
  (if (null? tree)
      nil
      (if (pair? tree)
          (cons (scale-tree (car tree) factor)
                (scale-tree (cdr tree) factor))
          (* tree factor))))

(define (scale-tree2 tree factor)
  (map (lambda (sub-tree)
         (if (null? sub-tree)
             nil
             (if (pair? sub-tree)
                 (scale-tree2 sub-tree factor)
                 (* sub-tree factor))))
       tree))
         

(define tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(check-equal? (scale-tree tree 10) (list 10 (list 20 (list 30 40) 50) (list 60 70)))
(check-equal? (scale-tree2 tree 10) (list 10 (list 20 (list 30 40) 50) (list 60 70)))