#lang sicp

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2)) add-dx b)
     dx))

(define (cube x) (* x x x))

(integral cube 0 1 0.01)


(define (simpsons-int f a b n)
  (define h (/ (- b a) n))

  (define (term k)
    (cond ((= k 0) (f a))
          ((even? k) (* 2 (f (+ a (* k h)))))
          (else (* 4 (f (+ a (* k h)))))))
  
  (* (sum term 0 inc n)
     (/ h 3.0)))

(define (simpsons-int2 f a b n)
  (define h (/ (- b a) n))

  (define (yk k)
    (f (+ a (* k h))))

  (define (term k)
    (* (cond ((= k 0) 1)
             ((even? k) 2)
             (else 4))
       (yk k)))

  
  (* (sum term 0 inc n)
     (/ h 3.0)))