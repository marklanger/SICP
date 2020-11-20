#lang sicp

;; Exercise 1.18
;; Design an iterative algorithm for multiplication that uses a logarithmic number of steps

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (multiply a b)
  (define (mult-iter total a b)
    (cond ((= b 0) total)
	  ((even? b)
	   (mult-iter total (double a) (halve b)))
	  (else (mult-iter (+ total a) a (- b 1)))))
  (mult-iter 0 a b))

(multiply 2 3)
(multiply 2 7)
(multiply 2 8)
(multiply 20 300)
