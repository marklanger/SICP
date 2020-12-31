#lang racket
(require sicp)

;; Exercise 2.29

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (total-weight current-branch)
  (cond ((null? current-branch)
	 0)
	((not (pair? current-branch))
	 current-branch)
	(else
	 (+ (total-weight (branch-structure (left-branch current-branch)))
	    (total-weight (branch-structure (right-branch current-branch)))))))

(define (balanced? current-tree)
  (cond ((null? current-tree) #t)
	((not (pair? current-tree)) #t)
	(else
	 (and (= (* (branch-length (left-branch current-tree))
		    (total-weight (branch-structure (left-branch current-tree))))
		 (* (branch-length (right-branch current-tree))
		    (total-weight (branch-structure (right-branch current-tree)))))
	      (balanced? (branch-structure (left-branch current-tree)))
	      (balanced? (branch-structure (right-branch current-tree)))))))

;; difference between cons and list:
;; cons makes pairs (which could be a list if it ends in '())
;; list makes lists, so it always ends with '()
;; going to have an issue where the base case will not be null, it will be a number (the weight)
;; given that we are using functions to access what we need,
;; we can just we can just change the access functions (car and cdr, instead of car and (car cdr))

(define test-branch (make-mobile (make-branch 2 (make-mobile (make-branch 2 3) (make-branch 3 4))) (make-branch 2 3))) 

(define test-branch-2 (make-mobile (make-branch 2 (make-mobile (make-branch 4 3) (make-branch 3 4))) (make-branch 2 7))) 

(total-weight test-branch)
(balanced? test-branch)
(balanced? test-branch-2)
