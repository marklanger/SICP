#lang racket

(require sicp)

;; Exercise 1.30

(define (sum term a next b)
  (define (iter a result)
    (if (< b a) 
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

(* 8 (pi-sum 1 1000))
