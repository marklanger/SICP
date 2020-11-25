more specifically, half-way to n
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
(search-for-primes 1000 2000)
(search-for-primes 1000000 2000000)
(search-for-primes 1000000000 2000000000)

;;| TEST                                      |  OLD |   NEW |
;;|-------------------------------------------+------+-------|
;;| (search-for-primes 2 10)                  |   21 |    12 |
;;| (search-for-primes 2 10)                  |    1 |     1 |
;;| (search-for-primes 2 10)                  |    0 |     0 |
;;| (search-for-primes 1000 2000)             |    4 |     1 |
;;| (search-for-primes 1000 2000)             |    3 |     1 |
;;| (search-for-primes 1000 2000)             |    3 |     1 |
;;| (search-for-primes 1000000 2000000)       |   79 |    25 |
;;| (search-for-primes 1000000 2000000)       |  143 |    47 |
;;| (search-for-primes 1000000 2000000)       |   79 |    30 |
;;| (search-for-primes 1000000000 2000000000) | 2513 |   692 |
;;| (search-for-primes 1000000000 2000000000) | 2491 |   679 |
;;| (search-for-primes 1000000000 2000000000) | 2512 |   656 |

;; Seems to be much faster. Not sure if there is an issue with how I am testing.
