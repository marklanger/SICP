#lang racket
(require sicp)
(require racket/trace)

;; Exercise 2.41

(define (filter predicate sequence) 
  (cond ((null? sequence) nil) 
        ((predicate (car sequence)) 
         (cons (car sequence)  
               (filter predicate (cdr sequence)))) 
        (else (filter predicate (cdr sequence))))) 
 
(define (accumulate op initial sequence) 
  (if (null? sequence) 
      initial 
      (op (car sequence) 
          (accumulate op initial (cdr sequence))))) 
 
(define (enumerate-interval low high) 
  (if (> low high) 
      nil 
      (cons low (enumerate-interval (+ low 1) high)))) 
 
(define (flatmap proc seq) 
  (accumulate append nil (map proc seq))) 

(define (ordered-triples n s)
  (filter
   (λ (triple)
     (= s (accumulate + 0 triple)))
   (flatmap
    (λ (i)
      (flatmap
       (λ (j)
	 (map
	  (λ (k) (list i j k))
	  (enumerate-interval 1 (- j 1))))
       (enumerate-interval 1 (- i 1))))
    (enumerate-interval 1 n))))

(ordered-triples 10 15)
