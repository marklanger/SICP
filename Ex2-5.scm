#lang racket
(require sicp)

;; Exercise 2.5

(define (cons x y) 
  (lambda (m) (m x y)))

(define (car z) 
  (z (lambda (p q) p)))

(define (cdr z) 
  (z (lambda (p q) q)))


(define (expt-from-number initial-number base)
  ;; was having issues getting this to work with let
  (define (iter number count)
    (if (= (modulo number base) 0)
		 (iter (/ number base) (+ 1 count))
		 count))
    (iter initial-number 0))

(define (expt-cons x y)
  (* (expt 2 x) (expt 3 y)))

(define (expt-car z)
  (expt-from-number z 2))

(define (expt-cdr z)
  (expt-from-number z 3))

(define x (expt-cons 3 4))
(expt-car x)
(expt-cdr x)
