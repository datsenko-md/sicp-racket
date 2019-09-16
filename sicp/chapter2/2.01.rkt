#lang sicp

;(define (make-rat n d)
;  (let ((gcd (gcd n d))
;        (sign (if (< d 0)
;                  -
;                  +)))
;    (cons (/ (sign n) gcd) (/ (abs d) gcd))))

(define (make-rat n d)
  (define (sign x)
    (if (< x 0)
        -
        +))
  (let ((gcd (gcd n d)))
    (cons ((sign (* n d)) (abs (/ n gcd)))
          (abs (/ d gcd)))))