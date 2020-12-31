#lang racket
(require sicp)

;; Exercise 2.23

(define (for-each proc a)
  (cond ((null? a) #t)
	(else (proc (car a))
	      (for-each proc (cdr a)))))

(for-each 
 (lambda (x) (newline) (display x))
 (list 57 321 88))
