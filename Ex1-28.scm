#lang racket

(require sicp)

;; Exercise 1.28

(define (even? x)
  (= 0 (remainder x 2)))

(define (square x)
  (* x x))

(define (m-r-expmod base exp m)
  (define (check-for-nontriv-sq x)
    (cond ((and (= (square x) 1)
	        (not (= x (- m 1)))
		(not (= x 1)))
	   (square x)
	   0)))
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder 
          (square (m-r-expmod base (/ exp 2) m))
          m))
        (else
         (remainder 
          (* base (m-r-expmod base (- exp 1) m))
          m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (m-r-expmod a (- n 1) n)
       1))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) 
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

;; discuss with team
