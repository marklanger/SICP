#lang racket
(require sicp)
(require racket/trace)

;; Exercise 2.42

(define (filter predicate sequence) 
  (cond ((null? sequence) nil) 
        ((predicate (car sequence)) 
         (cons (car sequence)  
               (filter predicate (cdr sequence)))) 
        (else (filter predicate (cdr sequence))))) 

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (enumerate-interval low high) 
  (if (> low high) 
      nil 
      (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence) 
  (if (null? sequence) 
      initial 
      (op (car sequence) 
          (accumulate op initial (cdr sequence))))) 

(define empty-board nil)

(define (adjoin-position row col positions)
  (cons (list row col) positions))

(define (safe? col positions)
  (let ((test (car positions))
	(test-row (caar positions))
	(test-col (cadar positions))
	(rest (cdr positions)))
    (accumulate
     (λ (pos result)
       (let ((row (car pos))
	     (col (cadr pos)))
	 (and (not (= (- test-row test-col)
		      (- row col)))
	      (not (= (+ test-row test-col)
		      (+ row col)))
	      (not (= test-row row))
	      result)))
     true
     rest)))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) 
           (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position 
                    new-row 
                    k 
                    rest-of-queens))
                 (enumerate-interval 
                  1 
                  board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(queens 4)
