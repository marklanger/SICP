#lang racket

(require sicp)

;; Exercise 1.33

;; 1
(define (even? x)
  (= 0 (remainder x 2)))

(define (square x)
  (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  ;; can stop if you reach n, or more specifically, half-way to n
  (cond ((> (square test-divisor) n)
	 n)
	((divides? test-divisor n)
	 test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (if (= n 1)
      #f
      (= (smallest-divisor n) n)))

(define (filtered-accumulate predicate combiner null-value term a next b)
  (define (iter current result)
    (if (> current b)
	result
	(iter (next current) (if (predicate current)
				 (combiner (term current) result)
				 result))))
  (iter a null-value))

(define (sum-of-squares-of-primes a b)
  (filtered-accumulate prime? + 0 square a inc b))

(sum-of-squares-of-primes 1 5) ;; => 38
(sum-of-squares-of-primes 2 10) ;; => 87
;; should be 2^2+3^2+5^2+7^2 = 4+9+25+49 = 87

;; 2

(define (identity x) x)

(define (product-of-positive-relative-primes n)
  (filtered-accumulate
   (lambda (x) (= (gcd x n) 1))
   *
   1
   identity
   1
   inc
   n))

(product-of-positive-relative-primes 7) ;; => 720 
(product-of-positive-relative-primes 10) ;; => 189

