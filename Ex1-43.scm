#lang racket
(require sicp)

;; Exercise 1.43

(define (square x)
  (* x x))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f x)
  (if (= x 0)
      ;; at the end of the process add the function to receive x
      (lambda (a) a)
      ;; create f([next function])
      (compose f (repeated f (- x 1)))))
