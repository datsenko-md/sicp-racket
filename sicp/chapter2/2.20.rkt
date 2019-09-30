#lang sicp

(#%require rackunit)

;(define (same-parity first . items)
;  (define same-parity?
;    (if (even? first)
;        even?
;        odd?))
;  (define (iter items acc)
;    (cond ((null? items) acc)
;          ((same-parity? (car items)) (iter (cdr items) (append acc (list (car items)))))
;          (else (iter (cdr items) acc))))
;  (iter items (list first)))

(define (same-parity head . tail)
  (define (iter items acc)
    (if (null? items)
        acc
        (iter (cdr items)
              (if (even? (+ (car items) head))
                  (append acc (list (car items)))
                  acc))))
  (cons head (iter tail nil)))

(check-equal? (same-parity 1 2 3 4 5 6 7) (list 1 3 5 7))
(check-equal? (same-parity 2 3 4 5 6 7) (list 2 4 6))
