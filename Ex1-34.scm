#lang racket
(require sicp)

;; Exercise 1.34

(define (f g) (g 2))

(f f)

;; Type error
;; Expected a procedure that can be applied to arguments
