#lang racket
(require sicp)

;; Exercise 2.2

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (midpoint p1 p2)
  (let ((avg (lambda (x y) (/ (+ x y) 2)))
	(x1 (x-point p1))
	(y1 (y-point p1))
	(x2 (x-point p2))
	(y2 (y-point p2)))
    (make-point (avg x1 x2) (avg y1 y2))))


(define p1 (make-point 0 0))
(define p2 (make-point 1 1))

(midpoint p1 p2)
