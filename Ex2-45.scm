#lang racket

;; Exercise 2.45
(require sicp-pict)

(define (make-vect x y)
  (cons x y))

(define (xcor-vect v) (car v))
(define (ycor-vect v) (cdr v))

(define (v+w v1 v2)
  (cons (+ (xcor-vect v1) (xcor-vect v2))
        (+ (ycor-vect v1) (ycor-vect v2))))

(define (add-vect v1 v2)
  (cons (+ (xcor-vect v1) (xcor-vect v2))
        (+ (ycor-vect v1) (ycor-vect v2))))

(define (scalar-mult c v1)
  (cons (* c (xcor-vect v1))
        (* c (ycor-vect v1))))

(define (scale-vect c v1)
  (cons (* c (xcor-vect v1))
        (* c (ycor-vect v1))))

(define (sub-vector v1 v2)
  (add-vect v1 (scalar-mult -1 v2) ))

(define (v-w v1 v2)
  (v+w v1 (scalar-mult -1 v2) ))

(define vector1 (make-vect 2 -1))
(define vector2 (make-vect 2000 -5))
(define vector3 (make-vect 10 20))

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter
                (below smaller smaller)))))

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter
                                  (- n 1))))
        (below painter
                (beside smaller smaller)))))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter
                                (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right
                                   right))
              (corner (corner-split painter
                                    (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right
                         corner))))))

;(paint (corner-split einstein 5))

(define (split a b)
  (lambda (painter num)
    (if (= num 0)
	painter
	(let ((smaller ((split a b) painter (- num 1))))
	  (a painter
	     (b smaller smaller))))))

(define right-split-new (split beside below))
(define up-split-new (split below beside))
;; (paint (right-split-new einstein 3))

