#lang racket

(require sicp-pict)

;; Exercise 2.50

;; I keep forgetting which one edge1 is

;; (define (no-transformation painter)
;;   (transform-painter painter
;; 		     (make-vect 0.0 0.0)
;; 		     (make-vect 1.0 0.0)
;; 		     (make-vect 0.0 1.0)))

(define (flip-horiz painter)
  (transform-painter painter
		     (make-vect 1.0 0.0)
		     (make-vect 0.0 0.0)
		     (make-vect 1.1 1.1)))

(define (rotate-counter180 painter)
  (transform-painter painter
                     (make-vect 1.0 1.0)
		     (make-vect 0.0 1.0)
 		     (make-vect 1.0 0.0)))

(define (rotate-counter270 painter)
  (transform-painter painter
                     (make-vect 1.0 0.0)
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 0.0)))
