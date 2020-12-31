#lang racket
(require sicp)

;; Exercise 2.18

(define (my-reverse my-list)
  (define (reverse-iter old-list new-list)
    (if (null? old-list)
	new-list
	(reverse-iter (cdr old-list) (cons (car old-list) new-list))))
  (reverse-iter my-list nil))

(my-reverse (list 4 3 2 1))
