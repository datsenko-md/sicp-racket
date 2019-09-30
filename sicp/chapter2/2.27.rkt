#lang sicp

(#%require rackunit)

;(define (deep-reverse list)
;  (define (iter list acc)
;    (if (null? list)
;        acc
;        (iter (cdr list)
;              (cons (if (pair? (car list))
;                        (deep-reverse (car list))
;                        (car list))
;                    acc))))
;  (iter list nil))

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

(check-equal? (deep-reverse (list (list 1 2) (list 3 4))) (list (list 4 3) (list 2 1)))


