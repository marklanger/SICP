#lang racket

(require sicp)

;; Exercise 1.31
;; 1.

(define (even? x)
  (= 0 (remainder x 2)))

(define (identity x) x)

(define (multiply term a next b)
  (if (> a b)
      1
      (* (term a)
	 (multiply term (next a) next b))))

(define (factorial a)
  (multiply identity 1 inc a))

(define (wallis-pi x)
  (define calculate-nominator
    (lambda (n)
      (if (even? n)
	  (+ 2 n)
	  (+ 3 n))))
  (define calculate-denominator
    (lambda (n)
      (if (even? n)
	  (+ 3 n)
	  (+ 2 n))))
  (* 4.0
     (/ (multiply calculate-nominator 0 inc x)
      (multiply calculate-denominator 0 inc x))))

(wallis-pi 8)    ;; => 3.002175954556907
(wallis-pi 20)   ;; => 3.0740551602804422
(wallis-pi 100)  ;; => 3.1263793980429817

;; 2.
(define (multiply2 term a next b)
  (define (iter current result)
    (if (> current b)
	result
	(iter (next current) (* (term current) result))))
  (iter a 1))

(define (factorial2 a)
  (multiply2 identity 1 inc a))

(factorial2 4)

(define (wallis-pi2 x)
  (define calculate-nominator
    (lambda (n)
      (if (even? n)
	  (+ 2 n)
	  (+ 3 n))))
  (define calculate-denominator
    (lambda (n)
      (if (even? n)
	  (+ 3 n)
	  (+ 2 n))))
  (* 4.0
     (/ (multiply2 calculate-nominator 0 inc x)
      (multiply2 calculate-denominator 0 inc x))))

(wallis-pi2 100)  ;; => 3.1263793980429817
