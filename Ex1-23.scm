#lang racket
(require sicp)

;; Exercise 1.23

(define (even? x)
  (= 0 (remainder x 2)))

(define (square x)
  (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (next x)
  (if (= x 2)
      3
      (+ x 2)))

(define (find-divisor n test-divisor)
  ;; can stop if you reach n, or more specifically, half-way to n
  (cond ((> (square test-divisor) n)
	 n)
	((divides? test-divisor n)
	 test-divisor)
	(else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= (smallest-divisor n) n))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) 
			 start-time))
      nil))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes lower-bound upper-bound)
  (define (search-iter n)
    (timed-prime-test n)
    (if (>= n upper-bound)
	(begin (newline)
	       (display "Done")
	       (newline))
	(search-iter (+ 2 n))))
  (search-iter (if (even? lower-bound) (+ 1 lower-bound) lower-bound)))

(search-for-primes 2 10)
(search-for-primes 1000 1100)
(search-for-primes 1000000 1000100)
(search-for-primes 1000000000 1000000100)


;; | TEST                                    |   22 |   23 |
;; |-----------------------------------------+------+------|
;; | (s-f-p 2 10) - prime 1                  |    4 |    5 |
;; | (s-f-p 2 10) - prime 2                  |    2 |    2 |
;; | (s-f-p 2 10) - prime 3                  |    1 |    1 |
;; | (s-f-p 1000 1100) - prime 1             |    8 |    4 |
;; | (s-f-p 1000 1100) - prime 2             |   17 |    3 |
;; | (s-f-p 1000 1100) - prime 3             |    3 |    3 |
;; | (s-f-p 1000000 1000100) - prime 1       |  124 |  142 |
;; | (s-f-p 1000000 1000100) - prime 2       |  184 |  142 |
;; | (s-f-p 1000000 1000100) - prime 3       |  121 |  141 |
;; | (s-f-p 1000000000 1000000100) - prime 1 | 3352 | 1619 |
;; | (s-f-p 1000000000 1000000100) - prime 2 | 2397 | 1637 |
;; | (s-f-p 1000000000 1000000100) - prime 3 | 1349 | 1735 |
