#lang racket

;; Exercise 2.46
(require sicp-pict)

;; vectors

(define (make-vect x y)
  (cons x y))

(define (xcor-vect v) (car v))
(define (ycor-vect v) (cdr v))

(define vector1 (make-vect 2 -1))
(define vector2 (make-vect 2000 -5))
(define vector3 (make-vect 10 20))

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

;(scalar-mult 3 vector2)

(define (sub-vector v1 v2)
  (add-vect v1 (scalar-mult -1 v2) ))

(define (v-w v1 v2)
  (v+w v1 (scalar-mult -1 v2) ))

;; (define (make-frame-1 origin edge1 edge2)
;;   (list origin edge1 edge2))

(define (make-frame-2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (get-origin frame1)
  (car frame1))

;; TODO add way to get edge from make-frame-1
(define (get-edge1 frame1)
  (car (cdr frame1)))

(define (get-edge2 frame1)
  (cdr (cdr frame1)))


(define F1 (make-frame-2 vector3 vector1 vector2))

(get-edge1 F1)
(get-edge2 F1)


;; Exercise 2.48
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
			     (make-segment origin corner 2)
			     (make-segment corner1 opposite)
			     (make-segment corner2 opposite))))
    (segments->painter segments-list)))

(define (draw-x fr)
  (let ((origin (get-origin)))
    (segments->painter)))
;; (segments->painter )
;; (segments->painter )
