#lang sicp

(#%require rackunit
           "square.rkt")

;a = bq + aq + ap = b(q) + a(p + q)
;
;A` = bq + aq + ap
;B` = bp + aq;
;
;A`` = B`q + A`q + A`p
;B`` = B`p + A`q
;
;A`` = (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p
;...
;A`` = a(2pq + 2q^2 + p^2) + b(2pq + q^2)
;
;A`` = a(p` + `q) + b(q`)
;
;q` = 2pq + q^2
;p` = (2pq + 2q^2 + p^2) - (2pq + q^2) = p^2 + q^2

(define (fib n)
    (define (fib-iter a b p q count)
        (cond ((= count 0) b)
            ((even? count)
             (fib-iter a
                       b
                       (+ (square p)
                          (square q))
                       (+ (* 2 p q)
                          (square q))
                       (/ count 2)))
            (else (fib-iter (+ (* b q) (* a q) (* a p))
                            (+ (* b p) (* a q))
                            p
                            q
                            (- count 1)))))
        (fib-iter 1 0 0 1 n))

(#%provide fib)

(check-equal? (fib 10) 55)