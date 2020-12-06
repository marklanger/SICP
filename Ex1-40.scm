#lang racket
(require sicp)

;; Exercise 1.40

(define tolerance 0.00001)

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

(define (cube x)
  (* x x x))

(define (square x)
  (* x x))

(define dx 0.00001)

(define deriv
  (lambda (f)
    (lambda (x)
      (/ (- (f (+ x dx))
     (f x))
  dx))))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) 
	    ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) 
	       guess))

(define (cubic a b c)
  (lambda (x)
    (+ (cube x)
       (* a (square x))
       (* b x)
       c)))

