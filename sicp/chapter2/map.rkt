#lang sicp

(#%require rackunit)

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(check-equal? (map (lambda (x)
                     (* x x))
                   (list 1 2 3 4))
              (list 1 4 9 16))

(#%provide map)