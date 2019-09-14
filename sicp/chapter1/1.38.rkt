#lang sicp

(define (cont-frac-rec n d k)
  (define (rec i)
    (/ (n i)
       (+ (d i)
          (if (= i k)
              0
              (rec (+ i 1))))))
  (rec 1))

(define (appr-e-rec k)
  (define (n i) 1)
  (define (d i)
    (if (= (remainder (+ i 1) 3) 0)
        (* 2 (/ (+ i 1) 3))
        1))
  (+ 2.0 (cont-frac-rec n d k)))

(define (cont-frac-iter n d k)
  (define (iter k acc)
    (if (= k 0)
        acc
        (iter (- k 1) (/ (n k)
                         (+ (d k) acc)))))
  (iter k 0))
  
(define (appr-e-iter k)
  (define (n i) 1)
  (define (d i)
    (if (= (remainder (+ i 1) 3) 0)
        (* 2 (/ (+ i 1) 3))
        1))
  (+ 2.0 (cont-frac-iter n d k)))

;(appr-e-rec 100)
;(appr-e-iter 1000)
