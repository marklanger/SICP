#lang racket
(require sicp)

;; Exercise 2.30

(define (square x)
  (* x x))

(define (square-tree items)
  (map
   (lambda (x)
     (if (pair? x)
	 (square-tree x)
	 (square x)))
   items))

