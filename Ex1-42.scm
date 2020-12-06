#lang racket
(require sicp)

;; Exercise 1.42

(define (square x)
  (* x x))

(define (compose f g)
  (lambda (x)
    (f (g x))))

((compose square inc) 6)
