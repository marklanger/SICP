#lang racket

(require sicp)

;; Exercise 1.23
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
  (newline)
  (display n)
  (start-prime-test n (runtime))
  (newline))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) 
                       start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes low high)
  (define (search-iter n primecount primes)
    (cond ((or (= 3 primecount)
               (= n high)) (map timed-prime-test primes))
	  ((prime? n) (search-iter (+ 2 n) (+ 1 primecount) (cons n primes)))
	  (else (search-iter (+ 2 n) primecount primes))))
   (if (even? low)
	 (search-iter (+ low 1) 0 '())
	 (search-iter low 0 '())))

(search-for-primes 2 10)
;;7 *** 21
;;5 *** 1
;;3 *** 0
(search-for-primes 1000 2000)
;;1019 *** 4
;;1013 *** 3
;;1009 *** 3
(search-for-primes 1000000 2000000)
;;1000037 *** 79
;;1000033 *** 143
;;1000003 *** 79
(search-for-primes 1000000000 2000000000)
;;1000000021 *** 2513
;;1000000009 *** 2491
;;1000000007 *** 2512
