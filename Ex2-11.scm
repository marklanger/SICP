#lang racket
(require sicp)

;; Exercise 2.11

(define (make-interval a b) (cons a b))

(define (upper-bound r)
  (max (car r)
       (cdr r)))

(define (lower-bound r)
  (min (car r)
       (cdr r)))

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

(define (mul-interval2 x y)
  ;; Sigh - just learned that let doesn't evaluate each of these in order (so can't refer to
  ;; previous let bindings) --> let* /does/, though, so I've used it here -- maybe that's
  ;; cheating
  (let* ((low-x (lower-bound x))
	(upper-x (upper-bound x))
	(low-y (lower-bound y))
	(upper-y (upper-bound y))
	(both-x-neg (< upper-x 0))
	(both-x-pos (< 0 low-x))
	(both-y-neg (< upper-y 0))
	(both-y-pos (< 0 low-y)))
    (cond (both-x-neg
	   (cond (both-y-neg (make-interval (* upper-x upper-y)
					      (* low-x low-y)))
		 (both-y-pos (make-interval (* low-x upper-y)
					      (* upper-x low-y)))))
	  (both-x-pos
	   (cond (both-y-neg (make-interval (* upper-x low-y)
					      (* low-x upper-y)))
		 (both-y-pos (make-interval (* low-x low-y)
					      (* upper-x upper-y)))))
	  (else
	   (let ((p1 (* low-x low-y))
		 (p2 (* low-x upper-y))
		 (p3 (* upper-x low-y))
		 (p4 (* upper-x upper-y)))
	     (make-interval (min p1 p2 p3 p4)
			    (max p1 p2 p3 p4)))))))

(mul-interval2 (make-interval 2 3) (make-interval 4 7))
(mul-interval2 (make-interval 2 3) (make-interval -4 -7))
(mul-interval2 (make-interval -2 -3) (make-interval 4 7))
(mul-interval2 (make-interval -2 -3) (make-interval -4 -7))
(mul-interval2 (make-interval 2 -3) (make-interval -4 7))
