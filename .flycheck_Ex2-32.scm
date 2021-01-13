#lang racket
(require sicp)

;; Exercise 2.32

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (??) rest)))))


(subsets (list 1 2 3))


;; the logic seems similar to the change problem
;; the full list of subsets would e
;; a subset is the set of all subsets excluding the first number
;; a set of all 