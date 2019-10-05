#lang sicp

(#%require rackunit
           "accumulate.rkt"
           "accumulate-n.rkt")

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row)
         (dot-product row v))
       m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row)
           (matrix-*-vector cols row))
         m)))

(test-case
 "Matrix Operations test"
 (define m (list (list 1 2 3 4)
                 (list 4 5 6 6)
                 (list 6 7 8 9)))
 
 (define mT (list (list 1 4 6)
                  (list 2 5 7)
                  (list 3 6 8)
                  (list 4 6 9)))
 
 (define m-*-mT (list (list 30 56 80)
                      (list 56 113 161)
                      (list 80 161 230)))
 (define v (list 1 2 3 4))
 (define w (list 5 6 7 8))
 
 (check-equal? (dot-product v w) 70)
 (check-equal? (matrix-*-vector m v) (list 30 56 80))
 (check-equal? (transpose m) mT)
 (check-equal? (matrix-*-matrix m mT) m-*-mT))