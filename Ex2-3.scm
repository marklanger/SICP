#lang racket
(require sicp)

;; Exercise 2.3

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (midpoint p1 p2)
  (let ((avg (lambda (x y) (/ (+ x y) 2)))
	(x1 (x-point p1))
	(y1 (y-point p1))
	(x2 (x-point p2))
	(y2 (y-point p2)))
    (make-point (avg x1 x2) (avg y1 y2))))

;; (define (make-rect p1 p2)
;;   (let ((a p1)
;; 	(b (make-point (x-point p1) (y-point p2)))
;; 	(c (make-point (x-point p2) (y-point p1)))
;; 	(d p2))
;;     (cons a b c d)))

(define (make-rect p1 p2)
  (cons p1 p2))

(define (height-rect r)
  (abs (- (y-point p2)
	  (y-point p1))))

(define (width-rect r)
  (abs (- (x-point p2)
	  (x-point p1))))

(define (perim-rect r)
  (+ (* 2 (height-rect2 r))
     (* 2 (width-rect2 r))))

(define (area-rect r)
  (* (height-rect2 r)
     (width-rect2 r)))

(define p1 (make-point 0 0))
(define p2 (make-point (- 3) (- 3)))

(define myrect1 (make-rect p1 p2))

(perim-rect myrect1)
(area-rect myrect1)

(define (make-rect2 center height width)
  (cons (cons center width) (cons center height)))

(define (width-rect2 r)
  (cdr (car r)))

(define (height-rect2 r)
  (cdr (cdr r)))

(define myrect2 (make-rect2 (make-point 3 3) 2 8))

(perim-rect myrect2)
(area-rect myrect2)
