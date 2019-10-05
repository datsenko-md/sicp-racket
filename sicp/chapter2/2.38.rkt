#lang sicp

(#%require rackunit)

(define (fold-right op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op (car rest)
                  result)
              (cdr rest))))
  (iter initial sequence))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

;(fold-right / 1 (list 1 2 3)); => 1.5
;(fold-left / 1 (list 1 2 3)); =>  1/6
;(fold-right list nil (list 1 2 3)); => (3 (2 (1 ())))
;(fold-left list nil (list 1 2 3)); =>  (((() 1) 2) 3)
;
; Для того, чтобы fold-left и fold-right
; давали одинаковые результаты
; для любой последовательности,
; неободимо, чтобы операция ор
; обладала свойством комутативности,
; т.е. её результат не зависел от
; порядка операндов. Например,
; операция умножения коммутативна,
; поэтому:
;
;(fold-right * 1 (list 1 2 3)); => 6
;(fold-left * 1 (list 1 2 3)); => 6