#lang mit

;; Exercise 1.7
(define (square x)
  (* x x))

;; (define (sqrt-iter guess x)
;;   (if (good-enough? guess x)
;;       guess
;;       (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

;; (define (sqrt x)
;;   (sqrt-iter 1.00 x))

;; for small numbers, .001 may just be too big (even bigger than the original number, so it will likely stop way too soon)
;; for large numbers, the guess won't get down to something that will be close enough

;; Alternative good-enough?
;; currently - checks to see if the guess square is close enough to the number of the number we're trying to square root
;; goal - take the last guess and compare it to 

(define (sqrt-iter guess last-guess x)
  (if (good-enough2? last-guess guess)
      guess
      (sqrt-iter (improve guess x) guess x)))

(define (good-enough2? last-guess guess)
  (< (abs (- last-guess guess))
     0.0001))

(define (sqrt x)
  (sqrt-iter 1.00 x x))
