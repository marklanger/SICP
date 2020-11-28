#lang racket

(require sicp)

;; Exercise 1.23

;; NOTE: The following commented program is what I originally put together because I forgot
;; how timed-prime-test worked and thought I needed to give it only primes
;; (define (search-for-primes low high)
;;   (define (search-iter n primecount primes)
;;     (cond ((or (= 3 primecount)
;;                (= n high)) (map timed-prime-test primes))
;; 	  ((prime? n) (search-iter (+ 2 n) (+ 1 primecount) (cons n primes)))
;; 	  (else (search-iter (+ 2 n) primecount primes))))
;;   (if (even? low)
;;       (search-iter (+ low 1) 0 '())
;;       (search-iter low 0 '())))

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
  (= (smallest-divisor n) n))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) 
			 start-time))))

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

;; | TEST                                    |   22 |
;; |-----------------------------------------+------|
;; | (s-f-p 2 10) - prime 1                  |    4 |
;; | (s-f-p 2 10) - prime 2                  |    2 |
;; | (s-f-p 2 10) - prime 3                  |    1 |
;; | (s-f-p 1000 1100) - prime 1             |    8 |
;; | (s-f-p 1000 1100) - prime 2             |   17 |
;; | (s-f-p 1000 1100) - prime 3             |    3 |
;; | (s-f-p 1000000 1000100) - prime 1       |  124 |
;; | (s-f-p 1000000 1000100) - prime 2       |  184 |
;; | (s-f-p 1000000 1000100) - prime 3       |  121 |
;; | (s-f-p 1000000000 1000000100) - prime 1 | 3352 |
;; | (s-f-p 1000000000 1000000100) - prime 2 | 2397 |
;; | (s-f-p 1000000000 1000000100) - prime 3 | 1349 |
