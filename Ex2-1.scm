#lang racket
(require sicp)

;; Exercise 2.1

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
	       (* (numer y) (denom x)))
	    (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
	       (* (numer y) (denom x)))
	    (* (denom x) (denom y))))

(define (mult-rat x y)
  (make-rat (* (numer x) (numer y))
	    (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y)
	       (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define (numer x) (car x))

(define (denom x) (cdr x)) 

(define (make-rat x y)
  (cond ((< 0 (* x y)) (cons x y))
	((> 0 (* x y)) (cons (- (abs x)) (abs y)))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))
