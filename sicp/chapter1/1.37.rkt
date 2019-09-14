#lang sicp

(define (golden-ratio-rec k)
  (/ 1
     (cont-frac-rec (lambda (i) 1.0)
                (lambda (i) 1.0)
                k)))

(define (cont-frac-rec n d k)
  (define (rec i)
    (/ (n i)
       (+ (d i)
          (if (= i k)
              0
              (rec (+ i 1))))))
  (rec 1))

(define (golden-ratio-iter k)
  (/ 1
     (cont-frac-iter (lambda (i) 1.0)
                (lambda (i) 1.0)
                k)))

(define (cont-frac-iter n d k)
  (define (iter k acc)
    (if (= k 0)
        acc
        (iter (- k 1) (/ (n k) (+ (d k) acc)))))
  (iter k 0))

(golden-ratio-rec 1000)
(golden-ratio-iter 1000)
