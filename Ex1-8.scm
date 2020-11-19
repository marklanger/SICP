#lang mit

(define (improve guess x)
  (/ (+ (/ x
	    (expt guess 2))
	 (* guess 2))
     3))

(define (cbrt-iter guess last-guess x)
  (if (good-enough2? last-guess guess)
      guess
      (cbrt-iter (improve guess x) guess x)))

(define (good-enough2? last-guess guess)
  (< (abs (- last-guess guess))
     0.0001))

(define (cbrt x)
  (cbrt-iter 1.00 x x))
