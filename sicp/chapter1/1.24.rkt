#lang sicp

(#%require "is-fast-prime.rkt")

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;1009 *** 93
;1013 *** 34
;1019 *** 32
;10007 *** 44
;10009 *** 39
;10037 *** 39
;100003 *** 118
;100043 *** 122
;100049 *** 135
;1000003 *** 159
;1000033 *** 155
;1000037 *** 163

