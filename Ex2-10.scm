#lang racket
(require sicp)

;; Exercise 2.10

(define (make-interval a b) (cons a b))

(define (upper-bound r)
  (max (car r)
       (cdr r)))

(define (lower-bound r)
  (min (car r)
       (cdr r)))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) 
                    (lower-bound y))
                 (+ (upper-bound x) 
                    (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) 
               (lower-bound y)))
        (p2 (* (lower-bound x) 
               (upper-bound y)))
        (p3 (* (upper-bound x) 
               (lower-bound y)))
        (p4 (* (upper-bound x) 
               (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (if (<= (* (lower-bound y) (upper-bound y)) 0)
      (display "Second interval can't span zero")
      (mul-interval x 
                    (make-interval 
                     (/ 1.0 (upper-bound y)) 
                     (/ 1.0 (lower-bound y))))))


(define (sub-interval x y)
  (add-interval x
		(make-interval (- (lower-bound y))
			       (- (upper-bound y)))))

(define (width-interval r)
  (abs (/ (- (upper-bound r) (lower-bound r))
	  2.0)))

(define a (make-interval 2 5))
(define b (make-interval -2 3))

(div-interval a b)
