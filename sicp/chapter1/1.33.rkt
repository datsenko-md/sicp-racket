#lang sicp

(#%require rackunit
           "is-prime.rkt"
           "square.rkt")

(define (filtered-accumulate filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a)
                    (filtered-accumulate filter combiner null-value
                                         term (next a) next b))
          (combiner null-value
                    (filtered-accumulate filter combiner null-value
                                         term (next a) next b)))))


(define (sum-of-squares-of-primes a b)
  (filtered-accumulate prime? + 0 square a inc b))

(define (product-of-integers-less-than n)
  (define (filter x)
    (= (gcd x n) 1))
  (filtered-accumulate filter * 1 identity  1 inc n))

(check-equal? (sum-of-squares-of-primes 3 7) 83)
(check-equal? (product-of-integers-less-than 10) 189)


