#lang racket
(require sicp)

;; Exercise 1.35

;; Golden mean is: x^2 = x + 1
;; If we divide both sides by x, we get:
;; x = 1 + 1/x

(define tolerance 0.00001)

(define (average a b)
  (/ (+ a b) 2))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (golden-ratio n)
  (fixed-point
   (lambda (x) (average x (+ 1 (/ 1 n))))
   1.00))
