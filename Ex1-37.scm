#lang racket
(require sicp)

;; Exercise 1.37
;; recursive
(define (cont-frac-r n d k)
  (define (loop count)
    (/ (n count)
       (+ (d count)
	  (if (= count k)
	      0
	      (loop (+ 1 count))))))
  (loop 1))

;; iterative
(define (cont-frac-i n d k)
  (define (iter count total)
    (if (= count 0)
	total
	(iter (- count 1) (/ (n count)
			     (+ (d count)
				total)))))
  (iter k 0))
