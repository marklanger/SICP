#lang mit

;; Exercise 1.5
(define (p) (p))

(define (test x y) 
  (if (= x 0) 
      0 
      y))

;; normal-order evaluation
(test 0 (p)) ;; Step 1
((if (= 0 0) 0 (p))) ;; Step 2
0 ;; does not get to the broken (p)

;; applicative-order evaluation
(test 0 (p)) ;; Gets stuck here, as (p) is broken and can't evaluate
