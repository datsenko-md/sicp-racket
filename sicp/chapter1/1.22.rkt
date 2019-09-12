#lang sicp

(#%require "is-prime.rkt")

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes start end)
  (define (iter cur)
    (if (<= cur end)
        (timed-prime-test cur))
    (if (<= cur end)
        (iter (+ 2 cur))))

  (iter (if (even? start)
            (+ start 1)
            start)))

;Results:
;1009 *** 97
;1013 *** 97
;1019 *** 98
;10007 *** 969
;10009 *** 942
;10037 *** 941
;100003 *** 19099
;100043 *** 9466
;100049 *** 9498
;1000003 *** 98096
;1000033 *** 94872
;1000037 *** 96941