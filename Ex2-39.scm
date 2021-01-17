#lang racket
(require sicp)
;; (require racket/trace)

;; Exercise 2.39

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op 
                      initial 
                      (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (reverse-fldr sequence)
  (fold-right 
   (lambda (x y) (append y (list x))) nil sequence))

;; (trace fold-right)
(reverse-fldr '(1 2 3 4 5))

(define (reverse-fldl sequence)
  (fold-left 
   (lambda (x y) (cons y x)) nil sequence))

(reverse-fldl '(1 2 3 4 5))
