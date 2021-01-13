#lang racket
(require sicp)

;; Exercise 2.31

(define (tree-map procedure tree)
  (map
   (lambda (x)
     (if (pair? x)
	 (tree-map procedure x)
	 (procedure x)))))
