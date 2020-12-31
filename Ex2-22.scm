#lang racket
(require sicp)

;; Exercise 2.22

(define (square x) (* x x))

(define (square-list-fix-1 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

;; In the above example, you are building a new list by taking the first item of another list and appending it to the front of your new list.
;; That means that you reverse the order of the list.

(define (square-list-fix-2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square 
                     (car things))))))
  (iter items nil))

(square-list-fix-2 (list 1 2 3 4 5 6)) ;; (mcons (mcons (mcons (mcons (mcons (mcons '() 1) 4) 9) 16) 25) 36)

;; In this example, you are just creating pairs where the car is bigger and bigger.
;; But it remains two items long, with the cdr being the final number.
