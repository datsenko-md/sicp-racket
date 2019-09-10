#lang sicp

(#%require rackunit)

(define (factorial-rec n)
  (if (= n 1)
      1
      (* n
         (factorial-rec (- n 1)))))

(#%provide factorial-rec)

(check-equal? (factorial-rec 6) 720)