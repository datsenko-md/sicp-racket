#lang sicp

(define (prime? n)
  (= (smallest-divisor n) n))

(define (smallest-divisor n)
  (define (iter divisor n)
    (define (next divisor)
      (if (= divisor 2)
          3
          (+ divisor 2)))

    (cond ((= divisor n) n)
          ((divides? n divisor) divisor)
          (else (iter (next divisor) n))))
  (iter 2 n))

(define (divides? n divisor)
  (= (remainder n divisor) 0))

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

;1009 *** 339
;1013 *** 82
;1019 *** 80
;10007 *** 761
;10009 *** 762
;10037 *** 764
;100003 *** 8814
;100043 *** 7766
;100049 *** 8465
;1000003 *** 87217
;1000033 *** 84743
;1000037 *** 87561