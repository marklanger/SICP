#lang racket
(require sicp)

;; Exercise 2.21

(define (square-list-1 items)
  (if (null? items)
      nil
      (cons (expt (car items) 2) (square-list-1 (cdr items)))))

(define (square-list-2 items)
  (map (lambda (x) (* x x)) items))


(square-list-1 (list 1 2 3 4 5 6))
(square-list-2 (list 1 2 3 4 5 6))
