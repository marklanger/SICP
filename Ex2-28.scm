#lang racket
(require sicp)

;; Exercise 2.28

(define x 
  (list (list 1 2) (list 3 4)))

(define (fringe my-tree)
  (define (iter current-tree current-list-of-leaves)
    (cond ((null? current-tree) current-list-of-leaves)
	  ((not (pair? current-tree))
	   (cons current-tree current-list-of-leaves))
	  (else
	   (iter (car current-tree) (iter (cdr current-tree) current-list-of-leaves)))))
  (iter my-tree nil))

(fringe x)

(fringe (list x x))
