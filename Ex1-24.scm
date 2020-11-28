#lang racket

(require sicp)

;; Exercise 1.24
(define (even? x)
  (= 0 (remainder x 2)))

(define (square x)
  (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder 
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder 
          (* base (expmod base (- exp 1) m))
          m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) 
         (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 5)
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

(search-for-primes 2 10)
(search-for-primes 1000 1100)
(search-for-primes 1000000 1000100)
(search-for-primes 1000000000 1000000100)

;; | TEST                                    |   22 |   23 | 24 |
;; |-----------------------------------------+------+------+----|
;; | (s-f-p 2 10) - prime 1                  |    4 |    5 | 12 |
;; | (s-f-p 2 10) - prime 2                  |    2 |    2 |  7 |
;; | (s-f-p 2 10) - prime 3                  |    1 |    1 |  7 |
;; | (s-f-p 1000 1100) - prime 1             |    8 |    4 | 31 |
;; | (s-f-p 1000 1100) - prime 2             |   17 |    3 | 33 |
;; | (s-f-p 1000 1100) - prime 3             |    3 |    3 | 33 |
;; | (s-f-p 1000000 1000100) - prime 1       |  124 |  142 | 31 |
;; | (s-f-p 1000000 1000100) - prime 2       |  184 |  142 | 31 |
;; | (s-f-p 1000000 1000100) - prime 3       |  121 |  141 | 31 |
;; | (s-f-p 1000000000 1000000100) - prime 1 | 3352 | 1619 | 62 |
;; | (s-f-p 1000000000 1000000100) - prime 2 | 2397 | 1637 | 62 |
;; | (s-f-p 1000000000 1000000100) - prime 3 | 1349 | 1735 | 60 |
