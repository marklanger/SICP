#lang racket
(require sicp)

;; Exercise 2.6

;; Discuss with team

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))


(add-1 zero)
((lambda (f) (lambda (x) (f ((n f) x))))(lambda (f) (lambda (x) x)))
(lambda (x) (n (lambda (x) x)) x)
