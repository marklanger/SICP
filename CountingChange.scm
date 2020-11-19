;; Can we write a procedure to compute the number
;; of ways to change any given amount of money?

;; NOTES FROM TEXT ON RECURSIVE SOLUTION:
;; (1) the number of ways to change amount a using all but the first kind of coin, plus
;; (2) the number of ways to change amount a − d using all n kinds of coins, where d is the denomination of the first kind of coin. 

(define (count-change amount)
  (cc-iter amount 5))

(define (cc-iter amount kinds-of-coins)
  (cond ((= amount 0) 1)
	((or (< amount 0)
	     (= kinds-of-coins 0))
	 0)
	(else
	 (+ (cc-iter amount (- kinds-of-coins 1))
	    ;; the following is the count-change amount for (n-1)
	    ;; i.e., if you are building up from the bottom, this would be the stepping stone
	    (cc-iter (- amount (first-denomination kinds-of-coins))
		     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(count-change 1) ;; 1
(count-change 5) ;; 2
(count-change 10) ;; 4
(count-change 15) ;; 6
(count-change 20) ;; 9
(count-change 25) ;; 13
(count-change 50) ;; 50
(count-change 55) ;; 62

;; how to do this iteratively?
;; start at how many ways it takes to build amount one
;; add that together for the amount
;; for each step where there is a denomination change of 5 or more
;; need to add all 

;; things we need to keep track of:
;; amount number-of-ways
;; https://codereview.stackexchange.com/questions/147505/iterative-counting-change-implementation-in-mit-scheme

;; go through with pennies, then with nickels (and pennies), then dimes, etc.
(define (count-change-iterative amount)
  ;; assumes that the amount will be 1 or greater
  ;; this is a bottom up approach, read comments at the bottom first
  (define (cc-iter total half-dollars quarters dimes nickels)
    (cond ((> (* half-dollars 50) amount)
	   total)
	  ((> (+ (* half-dollars 50)
		 (* quarters 25))
	      amount)
	   (cc-iter total (+ 1 half-dollars) 0 0 0))
	  ((> (+ (* half-dollars 50)
		 (* quarters 25)
		 (* dimes 10))
	      amount)
	      (cc-iter total half-dollars (+ 1 quarters) 0 0))
	  ;; if the change that we have with nickels is greater than the amount, we've done everything we could with nickels
	  ;; bump nickels down to 0, then add a dime
	  ;; we then add nickels to our dimes in the same pattern
	  ((> (+ (* half-dollars 50)
		 (* quarters 25)
		 (* dimes 10)
		 (* nickels 5))
	      amount)
	   (cc-iter total half-dollars quarters (+ dimes 1) 0))
	  ;; each time through we see if the change we are putting together is less than the amount we need
	  ;; if it is, we add 1 to our total (pennies, if necessary, can fill in the rest)
	  (else (cc-iter (+ 1 total) half-dollars quarters dimes (+ nickels 1)))))
  (cc-iter 0 0 0 0 0))

(count-change-iterative 1000) ;; 801451
