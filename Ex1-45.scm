#lang racket
(require sicp)

;; Exercise 1.45


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

(define (average x y)
  (/ (+ x y )
     2))

(define (average-damp f)
  (lambda (x) 
    (average x (f x))))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f x)
  (if (= x 0)
      (lambda (a) a)
      (compose f (repeated f (- x 1)))))

(define (3rd-rt x)
  (fixed-point
   (average-damp (lambda (y) (/ x
				(* y y))))
   1.00))

(define (4th-rt x)
  (fixed-point
   (average-damp (average-damp (lambda (y) (/ x
					      (* y y y)))))
   1.00))

(define (5th-rt x)
  (fixed-point
   (average-damp (average-damp (lambda (y) (/ x
					      (* y y y y)))))
   1.00))

(define (6th-rt x)
  (fixed-point
   (average-damp (average-damp (lambda (y) (/ x
					      (* y y y y y)))))
   1.00))

(define (7th-rt x)
  (fixed-point
   (average-damp (average-damp (lambda (y) (/ x
					      (* y y y y y y)))))
   1.00))
