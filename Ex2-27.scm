#lang racket
(require sicp)

;; Exercise 2.27

(define (my-deep-reverse my-list)
  (define (reverse-iter old-list new-list)
          ;; 
    (cond ((null? old-list)
	   new-list)
	  ((not (pair? (car old-list)))
	   (reverse-iter (cdr old-list) (cons (car old-list) new-list)))
	  (else
	   (reverse-iter (cdr old-list) (cons (my-deep-reverse (car old-list)) new-list)))))
  (reverse-iter my-list nil))

(define x 
  (list (list 1 2) (list 3 4)))

(my-deep-reverse x)
