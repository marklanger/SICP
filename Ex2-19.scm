#lang racket
(require sicp)

;; Exercise 2.19
(define us-coins 
  (list 50 25 10 5 1))

(define uk-coins 
  (list 100 50 20 10 5 2 1 0.5))

(define uk-coins-reversed
  (list 0.5 1 2 5 10 20 50 100))

(define (first-denomination denominations)
  (car denominations))

(define (except-first-denomination denominations)
  (cdr denominations))

(define (no-more? denominations)
  (null? denominations))

(define (cc amount coin-values)
  (cond ((= amount 0) 
         1)
        ((or (< amount 0) 
             (no-more? coin-values)) 
         0)
        (else
         (+ (cc 
             amount
             (except-first-denomination 
              coin-values))
            (cc 
             (- amount
                (first-denomination 
                 coin-values))
             coin-values)))))

(cc 100 us-coins)
(cc 100 uk-coins)
(cc 100 uk-coins-reversed)

;; Still works just fine, as the logic here is not defined on the
;; order of the list -- It does take a lot long to calculate based
;; on denominations sorted low to high.
