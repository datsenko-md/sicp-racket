#lang sicp

(#%require rackunit)

(define (tr r c)
  (if (or (= c 0) (= c r))
      1
      (+ (tr (- r 1) c)
         (tr (- r 1) (- c 1)))))        

(#%provide tr)

;1
;1 1
;1 2 1
;1 3 3 1
;1 4 6 4 1
;...
(check-equal? (tr 4 2) 6)