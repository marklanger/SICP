#lang racket
(require sicp)

;; Exercise 1.44

(define dx .00001)

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f x)
  (if (= x 0)
      ;; at the end of the process add the function to receive x
      f
      ;; create f([next function])
      (compose f (repeated f (- x 1)))))

(define (smooth f)
  (lambda (x)
    (/ (+ f (- x dx)
	  f x
	  f (+ x dx))
       3)))

(define (square x) (* x x))

(define (nth-fold f n)
  ((repeated smooth n) f))
