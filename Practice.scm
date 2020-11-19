#lang mit

(define (square x)
     (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y) 
  (/ (+ x y) 2))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

;; (define (good-enough2? guess x))

(define (square-root x)
  (sqrt-iter 1.00 x))
