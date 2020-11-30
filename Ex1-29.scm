#lang racket

(require sicp)

;; Exercise 1.29

(define (cube x)
  (* x x x))

(define (even? x)
  (= (remainder x 2) 0))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpsons-integral f a b n)
  ;; assumes that n is even
  ;; h definition provided
  (define h (/ (- b a) n))
  ;; calculates y
  (define (find-y k) (f (+ a (* k h))))
  ;; provides a function that will calculate the current term based on k
  (define simpsons-term
    (lambda (k)
      (cond ((or (= k 0) (= k n)) (find-y k))
	    ((even? k) (* (find-y k) 2))
	    (else (* (find-y k) 4)))))
  (* (/ h 3)
     (sum simpsons-term 0 inc n)))
