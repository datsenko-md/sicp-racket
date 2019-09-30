#lang sicp

(#%require rackunit)

(define (deep-reverse items)
  (define (iter items acc)
    (if (null? items)
        acc
        (let ((head (car items))
              (tail (cdr items)))
          (if (list? head)
              (iter tail (append (list (deep-reverse head)) acc))
              (iter tail (append (list head) acc))))))
  (iter items nil))

;(define x (list (list 1 2) (list 3 4)))
;x => ((1 2) (3 4))
;(reverse x) => ((3 4) (1 2))
;(deep-reverse x) => ((4 3) (2 1))

(check-equal? (deep-reverse (list (list 1 2) (list 3 4))) (list (list 4 3) (list 2 1)))

(#%provide deep-reverse)


