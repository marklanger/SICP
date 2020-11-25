#lang racket

(require sicp)

;;Exercise 1.27

;; Testing Carmichael numbers 561, 1105, 1729, 2465, 2821, and 6601

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

(define (modified-fermat-test n)
  (define (fermat-iter a)
    (cond ((= a n) '#t)
	  ((= a (expmod a n n)) (fermat-iter (+ a 1)))
	  (else '#f)))
  (fermat-iter 1))

(modified-fermat-test 13)

(map modified-fermat-test '(561 1105 1729 2465 2821 6601))
