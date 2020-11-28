#lang racket

(require sicp)

;; Exercise 1.25
(define (even? x)
  (= 0 (remainder x 2)))

(define (square x)
  (* x x))

(define (fast-expt b n)
  (cond ((= n 0) 
         1)
        ((even? n) 
         (square (fast-expt b (/ n 2))))
        (else 
         (* b (fast-expt b (- n 1))))))

(define (expmod1 base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder 
          (square (expmod1 base (/ exp 2) m))
          m))
        (else
         (remainder 
          (* base (expmod1 base (- exp 1) m))
          m))))

;; using expmod2 hangs for larger numbers (e.g., 1000000+)
;; clearly, there is more happening with bigger numbers that causes a delay
;; the big difference is the use of remainder
;; this takes the number we are squaring and then shrinks it down by a lot each time through
;; we are working with progressively smaller numbers, not progressively larger
(define (expmod2 base exp m)
  (remainder (fast-expt base exp) m))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod1 a n n
	) a))
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

