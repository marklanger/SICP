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
  (newline)
  (display n)
  (start-prime-test n (runtime))
  (newline))

;; Note, leaving this to test for prime, even though should not be necessary, to keep flexibility for future tests.
;; Also, I realized, that I was already anticipating some of these issues and was trying to resolve them in search-for-primes. Ah well.
(define (start-prime-test n start-time)
  (if (fast-prime? n 8)
      (report-prime (- (runtime) 
                       start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes low high)
  (define (search-iter n primecount primes)
    (cond ((or (= 3 primecount)
               (= n high)) (map timed-prime-test primes))
	  ((fast-prime? n 8) (search-iter (+ 2 n) (+ 1 primecount) (cons n primes)))
	  (else (search-iter (+ 2 n) primecount primes))))
   (if (even? low)
	 (search-iter (+ low 1) 0 '())
	 (search-iter low 0 '())))

(search-for-primes 2 10)
(search-for-primes 1000 2000)
(search-for-primes 1000000 2000000)
(search-for-primes 1000000000 2000000000)

;; Confirm with team
