#lang sicp

(define (deriv g)
  (define dx 0.00001)
  (lambda (x)
    (/ (- (g (+ x dx))
          (g x))
       dx)))

(#%provide deriv)


  
