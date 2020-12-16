#lang racket
(require sicp)

;; Exercise 2.26

(define x (list 1 2 3))
(define y (list 4 5 6))

(display (append x y))
;; (mcons 1 (mcons 2 (mcons 3 (mcons 4 (mcons 5 (mcons 6 '()))))))
(display (cons x y))
;; (mcons (mcons 1 (mcons 2 (mcons 3 '()))) (mcons 4 (mcons 5 (mcons 6 '()))))
(display (list x y))
;; (mcons
;;  (mcons 1 (mcons 2 (mcons 3 '())))
;;  (mcons (mcons 4 (mcons 5 (mcons 6 '()))) '()))
