#lang racket

;; Exercise 2.47
(require sicp-pict)

(define (make-frame-1 origin edge1 edge2)
  (list origin edge1 edge2))

(define (get-origin-1 frame1)
  (car frame1))

(define (get-first-edge-1 frame1)
  (car (cdr frame1)))

(define (get-second-edge-1 frame1)
  (car (cdr (cdr frame1))))

;; -----------------------------------------------
;; -----------------------------------------------

(define (make-frame-2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (get-origin-2 frame1)
  (car frame1))

(define (get-first-edge-2 frame1)
  (car (cdr frame1)))

(define (get-second-edge-2 frame1)
  (cdr (cdr frame1)))

(define F1 (make-frame-2 vector3 vector1 vector2))

(get-first-edge-1 F1)
(get-second-edge-2 F1)


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
