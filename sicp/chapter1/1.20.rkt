#lang sicp

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;Нормальный порядок
;(gcd 206 40)
;(gcd 40 (remainder 206 40))
;(gcd (remainder 206 40) 
;     (reminder 40 (reminder 206 40)))
;...
;(!) remainder вызвана 4 раза
;
;
;Аппликативный порядок
;(gcd 206 40)
;(gcd 40 (remainder 206 40))
;(gcd 40 6)
;(gcd 6 (remainder 40 6))
;(gcd 6 4)
;(gcd 4 (remainder 6 4))
;(gcd 4 2)
;(gcd 2 (remainder 4 2))
;(gcd 2 0)
;2
;
;remainder вызвана 4 раза
