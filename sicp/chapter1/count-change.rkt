#lang sicp

(#%require rackunit)

(define (count-change amount)
  (define (cc amount kinds-of-coins)
    (cond ((= amount 0) 1)
          ((or (< amount 0) (= kinds-of-coins 0)) 0)
          (else (+ (cc amount
                       (- kinds-of-coins 1))
                   (cc (- amount (first-denomination kinds-of-coins))
                       kinds-of-coins)))))

  (define (first-denomination kind-of-coins)
    (cond ((= kind-of-coins 5) 50)
          ((= kind-of-coins 4) 25)
          ((= kind-of-coins 3) 10)
          ((= kind-of-coins 2) 5)
          ((= kind-of-coins 1) 1)))

  (cc amount 5))

(#%provide count-change)

(check-equal? (count-change 100) 292)