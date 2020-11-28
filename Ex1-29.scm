#lang racket

(requite sicp)

;; Exercise 1.29

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpsons-integral f a b n)
  (define (y f a n h)
    (f (+ a (* n h))))
  (define (h a b n)
    (/ (- b a) n))
  (define (int-iter y count))
  (* (/ (h a b n) 3)
     (+ (y f a n h)
	))
  )

(define (simpsons-integral f a b n)
  (if (> a b)
      0
      (+ (⟨term⟩ a) 
         (⟨name⟩ (⟨next⟩ a) b))))
