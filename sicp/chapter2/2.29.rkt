#lang sicp

(#%require rackunit)

(define (cadr item)
  (car (cdr item)))

(define (make-mobile left right)
  (list left right))
(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (cadr mobile))

(define (make-branch length structure)
  (list length structure))
(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (cadr branch))

(define (mobile? structure)
  (list? structure))

(define (branch-weight branch)
  (let ((structure (branch-structure branch)))
    (if (mobile? structure)
        (total-weight structure)
        structure)))

(define (total-weight mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (+ (branch-weight left)
       (branch-weight right))))

(define (torque branch)
  (* (branch-length branch)
     (let ((structure (branch-structure branch)))
       (if (mobile? structure)
           (total-weight structure)
           structure))))

(define (branch-balanced left right)
  (= (torque left) (torque right)))

(define (balanced? mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (let ((left-structure (branch-structure left))
          (right-structure (branch-structure right)))
      (and (branch-balanced left right)
           (if (mobile? left-structure)
               (balanced? left-structure)
               true)
           (if (mobile? right-structure)
               (balanced? right-structure)
               true)))))

(test-case
 "2.29 tests"
 (define branch (make-branch 10 3)); => (10 3)
 (define branch2 (make-branch 5 11)); => (5 11)
 (define mobile (make-mobile branch branch2)); => ((10 3) (5 11))
 
 (test-case
  "Branch test"
  (check-equal? (branch-length branch) 10)
  (check-equal? (branch-structure branch) 3))
 (test-case
  "Mobile test"
  (check-equal? (left-branch mobile) branch)
  (check-equal? (right-branch mobile) branch2))
 (test-case
  "Is Mobile? test"
  (check-false (mobile? (branch-structure branch)))
  (check-true (mobile? (branch-structure mobile))))
 (test-case
  "Branch-weight test"
  (check-equal? (branch-weight branch) 3))
 (test-case
  "Total-weight test"
  (define branch3 (make-branch 7 mobile))
  (define mobile2 (make-mobile branch branch3)); => ((10 3) (7 ((10 3) (5 11)))) 
  (check-equal? (total-weight mobile) 14)
  (check-equal? (total-weight mobile2) 17))
 (test-case
  "Torque test"
  (define branch3 (make-branch 7 mobile))
  (check-equal? (torque branch) 30)
  (check-equal? (torque branch3) 98))
 (test-case
  "Is Balanced? test"
  (define mobile2 (make-mobile (make-branch 3 (make-mobile (make-branch 9 3)
                                                           (make-branch 3 9)))  
                               (make-branch 4 (make-mobile (make-branch 10 3)
                                                           (make-branch 5 7)))))
  (define mobile3 (make-mobile (make-branch 10 3)
                               (make-branch 5 6)))
  (define mobile4 (make-mobile (make-branch 3 (make-mobile (make-branch 9 3)
                                                           (make-branch 3 9)))  
                               (make-branch 4 (make-mobile (make-branch 10 3)
                                                           (make-branch 5 6)))))
  (check-false (balanced? mobile))
  (check-false (balanced? mobile2))
  (check-true (balanced? mobile3))
  (check-true (balanced? mobile4))))

;Если изменить конструкторы на следующие:
;(define (make-mobile left right)
;  (cons left right))
;(define (make-branch length structure)
;  (cons length structure))

;То необходимо будет изменить методы доступа и предикат mobile?:
;(define (right-branch mobile)
;  (cdr mobile))
;(define (branch-structure branch)
;  (cdr branch))
;(define (mobile? structure)
;  (pair? structure))