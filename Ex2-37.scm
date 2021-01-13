#lang racket
(require sicp)

;; Exercise 2.37

;; Note - see discussion in SICP solutions
;; Don't have a good mental model for linear algebra/matrices yet

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op 
                      initial 
                      (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector matrix vector)
  (map (lambda (matrix-row) (dot-product matrix-row vector)) matrix))

(define (transpose matrix)
  (accumulate-n cons nil matrix))

(define (matrix-*-matrix matrix-1 matrix-2)
  (let ((cols (transpose matrix-2)))
    (map (lambda (m1-row)
	   (map (lambda m2-col)
		(dot-product m1-row m2-col)
		cols))
	 matrix-1)))
