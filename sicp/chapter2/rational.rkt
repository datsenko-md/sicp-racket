#lang sicp

(define (make-rat n d)
  (define (sign x)
    (if (< x 0)
        -
        +))
  (let ((gcd (gcd n d)))
    (cons ((sign (* n d)) (abs (/ n gcd)))
          (abs (/ d gcd)))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(#%provide make-rat
           numer
           denom
           add-rat
           sub-rat
           mul-rat
           div-rat
           equal-rat?)

(define x (make-rat 1 2))
(define y (make-rat 1 (- 3)))

(print-rat (mul-rat x y))