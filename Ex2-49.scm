#lang racket

(require sicp-pict)

;; Exercise 2.49

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

(define (make-segment v1 v2)
  (cons v1 v2))
(define (start-segment seg)
  (car seg))
(define (end-segment seg)
  (cdr seg))

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame) 
         (start-segment segment))
        ((frame-coord-map frame) 
         (end-segment segment))))
     segment-list)))

(define (draw-outline fr)
  (let ((origin (get-origin fr))
	(corner1 (add-vect (get-origin fr) (get-edge1 fr)))
	(corner2 (add-vect (get-origin fr) (get-edge2 fr)))
	(opposite (add-vect (corner1) (corner2)))
	(segments-list (list (make-segment origin corner1)
			     (make-segment origin corner2)
			     (make-segment corner1 opposite)
			     (make-segment corner2 opposite))))
    (segments->painter segments-list)))

(define (draw-x fr)
  (let ((origin (get-origin))
	(corner1 (add-vect (get-origin fr) (get-edge1 fr)))
	(corner2 (add-vect (get-origin fr) (get-edge2 fr)))
	(opposite (add-vect (corner1) (corner2)))
	(segments-list (list (make-segment origin opposite)
			     (make-segment corner1 corner2))))
    (segments->painter segments-list)))

;; Discuss with team
;; (define (draw-diamond fr)
;;   (let ((origin (get-origin))
;; 	(corner1 (add-vect (get-origin fr) (get-edge1 fr)))
;; 	(corner2 (add-vect (get-origin fr) (get-edge2 fr)))
;; 	(opposite (add-vect (corner1) (corner2)))
;; 	(segments-list (list (make-segment origin opposite)
;; 			     (make-segment corner1 corner2))))
;;     (segments->painter segments-list)))

;; (segments->painter (wave fr))
;; Have not implemented this.
