#lang racket
(require sicp)

;; Exercise 1.46

;; Definition of iterative improve
(define (iterative-improve good-enough-f improve-f)
  (lambda (first-guess)
    (define (iter guess)
      (if (good-enough-f guess)
	  guess
	  (iter (improve-f guess))))
    (iter first-guess)))

;; Updated definition of square-root
(define (square-root x)
  (let ((good-enough
	 (lambda (guess) (< (abs (- (* guess guess) x)) .001)))
	(improve
	 (lambda (guess) (/ (+ guess (/ x guess)) 2))))
    ((iterative-improve good-enough improve)
     1.00)))

;; (define (square-root x)
;;   (define (good-enough guess)
;;     (< (abs (- (* guess guess) x)) .001))
;;   (define (improve guess)
;;     (/ (+ guess (/ x guess)) 2))
;;   ((iterative-improve good-enough improve)
;;    1.00))

;; Updated definition of fixed-point
;; First - the old definition:

(define tolerance 0.00001)

(define (fixed-point-old f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;; Then - the updated definition

(define (fixed-point-new f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 
       tolerance))
  ((iterative-improve close-enough? f) first-guess))
