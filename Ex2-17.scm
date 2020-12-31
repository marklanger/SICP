#lang racket
(require sicp)

;; Exercise 2.17

(define (last-pair my-list)
  (if (null? (cdr my-list))
      (car my-list)
      (last-pair (cdr my-list))))

(last-pair (list 23 72 149 34))
