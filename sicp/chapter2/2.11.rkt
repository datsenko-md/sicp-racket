#lang sicp

(define (mul-interval x y)
  (let ((xu (upper-bound x))
        (xl (lower-bound x))
        (yu (upper-bound y))
        (yl (lower-bound y)))
    (cond ((and (> xu 0) (> xl 0) (> yu 0) (> yl 0)) ; + + + +
           (make-interval (* xu yu)
                          (* xl yl)))
          ((and (> xu 0) (> xl 0) (> yu 0) (< yl 0)) ; + + + -
           (make-interval (* xu yu)
                          (* xl yl)))
          ((and (> xu 0) (> xl 0) (< yu 0) (< yl 0)) ; + + - -
           (make-interval (* xl yu)
                          (* xu yl)))
          ((and (> xu 0) (< xl 0) (> yu 0) (> yl 0)) ; + - + +
           (make-interval (* xu yu)
                          (* xl yl)))
          ((and (> xu 0) (< xl 0) (> yu 0) (< yl 0)) ; + - + -
           (make-interval (max (* xu yu)
                               (* xl yl))
                          (min (* xu yu)
                               (* xl yl))))
          ((and (> xu 0) (< xl 0) (< yu 0) (< yl 0)) ; + - - -
           (make-interval (* xl yl)
                          (* xu yu)))
          ((and (< xu 0) (< xl 0) (> yu 0) (> yl 0)) ; - - + +
           (make-interval (* xu yl)
                          (* xl yu)))
          ((and (< xu 0) (< xl 0) (> yu 0) (< yl 0)) ; - - + -
           (make-interval (* xl yl)
                          (* xu yu)))
          ((and (< xu 0) (< xl 0) (< yu 0) (< yl 0)) ; - - - -
           (make-interval (* xl yl)
                          (* xu yu))))))

