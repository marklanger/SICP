#lang racket
(require sicp)

;; Exercise 2.32

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))


(subsets (list 1 2 3))


;; the logic seems similar to the change problem
;; the full list of subsets would equal both: 
;; 1. a subset is the set of all subsets excluding the first number
;; 2. a set of all those subsets where each includes the first number
