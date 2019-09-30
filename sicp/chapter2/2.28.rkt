#lang sicp

(#%require rackunit)

(define (fringe items)
  (define (iter items acc)
    (if (null? items)
        acc
        (let ((head (car items))
              (tail (cdr items)))
          (if (list? head)
              (iter tail (append acc (fringe head)))
              (iter tail (append acc (list head)))))))
  (iter items nil))
        
(define x (list (list 1 2) (list 3 4)))
(check-equal? (fringe x) (list 1 2 3 4))

