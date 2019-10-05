#lang sicp

(#%require rackunit)

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low
            (enumerate-interval (+ low 1) high))))

(check-equal? (enumerate-interval 2 7) (list 2 3 4 5 6 7))

(#%provide enumerate-interval)
