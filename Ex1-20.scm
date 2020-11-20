#lang sicp

;; Ex. 1-20

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;; normal order expansion
(gcd 206 40)
;; (40 > 0) compare b to 0 -- and b has 0 remainders
(gcd 40 (remainder 206 40))
;; (6 > 0) compare b to 0 -- and b has 1 remainders
(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
;; (4 > 0) compare b to 0 -- and b has 2 remainders (running total: 3)
(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;; (2 > 0) compare b to 0 -- and b has 4 remainders (running total: 7)
(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;; (o = 0) compare b to 0 -- and b has 7 remainders (running total: 14)
;; then calculate a, which has 4 remainders
(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;; total: 18

;; applicative order expansion
(gcd 206 40)
(gcd 40 (remainder 206 40))
;; (gcd 40 6)
(gcd 6 (remainder 40 6))
;; (gcd 6 4)
(gcd 4 (remainder 6 4))
;; (gcd 4 2)
(gcd 2 (remainder 4 2))
;; (gcd 2 0)
2
;; total: 4
