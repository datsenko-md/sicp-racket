#lang sicp

(#%require rackunit)

(define (length-r list)
  (if (null? list)
      0
      (+ 1 (length-r (cdr list)))))

(define (length-i list)
  (define (iter a count)
    (if (null? a)
        count
        (iter (cdr a) (+ count 1))))
  (iter list 0))

(define odds (list 1 3 5 7))

(check-equal? (length-r odds) 4)
(check-equal? (length-i odds) 4)