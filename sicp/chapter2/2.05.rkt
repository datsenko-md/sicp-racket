#lang sicp

(#%require rackunit)

(define (cons x y)
  (* (expt 2 x) (expt 3 y)))

(define (extract-expt base num)
  (define (iter count pow2 pow3)
    (cond ((= count 1) (if (even? base)
                         pow2
                         pow3))
          ((even? count) (iter (/ count 2) (+ pow2 1) pow3))
          (else (iter (/ count 3) pow2 (+ pow3 1)))))
  (iter num 0 0))

(define (car z)
  (extract-expt 2 z))

(define (cdr z)
  (extract-expt 3 z))

(define a (cons 7 4))
(check-equal? (car a) 7)
(check-equal? (cdr a) 4)