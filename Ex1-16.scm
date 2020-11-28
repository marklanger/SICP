#lang racket

(require sicp)

;; Exercise 1-16
;; Calculate b**n
;; using successive squaring

(define (fast-expt b n)
  (fast-expt-iter b n 1))

;;                       b    n       a
(define (fast-expt-iter num counter total)
  (cond ((= counter 0)
	 total)
	((not (even? counter))
	 (fast-expt-iter num (- counter 1) (* num total)))
	(else (fast-expt-iter (* num num) (/ counter 2) total))))

(define (even? n)
  (= (remainder n 2) 0))

(fast-expt 2 10)
