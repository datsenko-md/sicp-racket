#lang sicp

;(5, 3) => R1 = |5 - 3| / 2 = 1
;(7, 2) => R2 = |7 - 2| / 2 = 2.5
;
;(5, 3) + (7, 2) = (12, 5) => Rsum = |12 - 5| / 2 = 3.5 => (R1 + R2)
;(5, 3) - (7, 2) = (5, 3) + (-2, -7) = (3, -4) => Rsub = |3 - (-4)| / 2 = 3.5 => (R1 + R2)
;(5, 3) * (7, 2) = (35, 6) => Rmul = |35 - 6| / 2 = 14.5
;(5, 3) / (7, 2) = (5, 3) * (1/2, 1/7) = (5/2, 3/7) => Rdiv = |5/2 - 3/7| / 2 = 1.04