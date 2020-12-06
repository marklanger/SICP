#lang racket
(require sicp)

;; Exercise 1.39

(define (cont-frac-r n d k)
  (define (loop count)
    (/ (n count)
       (+ (d count)
	  (if (= count k)
	      0
	      (loop (+ 1 count))))))
  (loop 1.0))

(define (tan-cf x k)
  (cont-frac-r (lambda (y) (if (= y 1) x (- (* x x))))
	       (lambda (y) (+ y (- y 1)))
	       k))
