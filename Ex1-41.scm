#lang racket
(require sicp)

;; Exercise 1.41

(define (double f)
  (lambda (x)
    (f (f x))))

;; racket@Ex1-41.scm> (((double (double double)) inc) 5)
;; 21
