#lang racket
(require sicp)

;; Exercise 2.20

(define (same-parity a . b)
  (define (same-parity-iter old-list new-list)
    (if (null? old-list)
	new-list
	(if (= 0 (remainder (car old-list) a))
	    (same-parity-iter (cdr old-list) (cons (car old-list) new-list))
	    (same-parity-iter (cdr old-list) new-list))))
  (reverse (same-parity-iter b nil)))

(same-parity 2 3 4 5 6 7 8)
