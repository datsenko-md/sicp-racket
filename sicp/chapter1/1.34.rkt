#lang sicp

(define (f g)
  (g 2))

;(f f)
;(f 2)
;(2 2)

;При попытке вычислить (2 2) возникнет ошибка,
;так как 2 не является процедурой.