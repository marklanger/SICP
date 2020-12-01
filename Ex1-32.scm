#lang racket

(require sicp)

;; Exercise 1.32
;; 1

(define (identity x) x)

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
		(accumulate combiner null-value term (next a) next b))))


(define (fibonacci x)
  (accumulate * 1 identity 1 inc x))

(fibonacci 4)


;; 2
(define (accumulate-iter combiner null-value term a next b)
  (define (iter current result)
    (if (> current b)
	result
	(iter (next current) (combiner (term current) result))))
  (iter a null-value))

(define (fibonacci-iter x)
  (accumulate-iter * 1 identity 1 inc x))

(fibonacci-iter 4)
