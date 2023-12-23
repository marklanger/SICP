#lang racket
(require sicp)
(require racket/trace)

;; Exercise 2.54

;; NOTE - Issue: (eq? '(1 2) '(1 2)) returns #f, which I believe
;; does not match SICP

;; Per https://stackoverflow.com/questions/16299246/what-is-the-difference-between-eq-eqv-equal-and-in-scheme,
;; it looks like eq? refers to pointers in scheme, not a more general equivalency
;; I created my-equal? and used equal? instead of eq? below.

(define (my-equal? list-a list-b)
  (cond ((and (null? list-a)
	      (null? list-b))
	 #t)
	((or (null? list-a)
	     (null? list-b))
	 #f)
	((not (equal? (car list-a) (car list-b)))
	 #f)
	(else (my-equal? (cdr list-a) (cdr list-b)))))

(my-equal? '(a) '(a))
(my-equal? '(a) '(b))

;; tests from SICP solutions
(my-equal? '(1 2 3 (4 5) 6) '(1 2 3 (4 5) 6)) 
(my-equal? '(1 2 3 (4 5) 6) '(1 2 3 (4 5 7) 6)) 
