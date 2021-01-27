#lang racket

(require sicp-pict)

;; Exercise 2.51


(define (flip-horiz painter)
  (transform-painter painter
		     (make-vect 1.0 0.0)
		     (make-vect 0.0 0.0)
		     (make-vect 1.1 1.1)))

(define (below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    let ((paint-above (transform-painter
		       painter2
		       split-point
		       (make-vect 1.0 0.5)
		       (make-vect 0.0 1.0)))
	 (paint-below (transform-painter
		       painter1
		       (make-vect 0.0 0.0)
		       (make-vect 1.0 0.5)
		       split-point)))
    (lambda (frame)
      (paint-above frame)
      (paint-below frame))))
