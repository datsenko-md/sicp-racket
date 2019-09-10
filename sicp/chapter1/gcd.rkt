#lang sicp

(#%require rackunit)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(#%provide gcd)

(check-equal? (gcd 206 40) 2)
