#lang sicp

(#%require rackunit)

(define (make-interval a b) (cons a b))

(define (upper-bound interval)
  (max (car interval)
       (cdr interval)))

(define (lower-bound interval)
  (min (car interval)
       (cdr interval)))

(define (add-interval x y)
  (make-interval (+ (upper-bound x) (upper-bound y))
                 (+ (lower-bound x) (lower-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (upper-bound x) (upper-bound y)))
        (p2 (* (upper-bound x) (lower-bound y)))
        (p3 (* (lower-bound x) (upper-bound y)))
        (p4 (* (lower-bound x) (lower-bound y))))
    (make-interval (max p1 p2 p3 p4)
                   (min p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

;(define (sub-interval x y)
;  (let ((min (- (lower-bound x) (upper-bound y)))
;        (max (- (upper-bound x) (lower-bound y))))
;    (make-interval min max)))

(define (sub-interval x y)
  (add-interval x
                (make-interval (- (upper-bound y))
                               (- (lower-bound y)))))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (upper-bound i) (lower-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (make-interval (* c (+ 1 p))
                 (* c (- 1 p))))

(define (percent i)
  (- (/ (upper-bound i) (center i)) 1))

(define a (make-interval 3 5))
(define b (make-interval 7 2))
(check-equal? (upper-bound a) 5)
(check-equal? (lower-bound a) 3)

(define c (add-interval a b))
(check-equal? (upper-bound c) 12)
(check-equal? (lower-bound c) 5)

(define d (mul-interval a b))
(check-equal? (upper-bound d) 35)
(check-equal? (lower-bound d) 6)

(define e (div-interval a b))
(check-equal? (upper-bound e) (/ 5.0 2))
(check-equal? (lower-bound e) (/ 3.0 7))

(define f (sub-interval a b))
(check-equal? (upper-bound f) 3)
(check-equal? (lower-bound f) (- 4))

(define g (make-center-width 10 4))
(check-equal? (center g) 10)
(check-equal? (width g) 4)

(define h (make-center-percent 10 10))
(check-equal? (center h) 10)
(check-equal? (percent h) 10)
