#lang racket

;; Exercise 2.44
(require sicp-pict)

;; (define wave2 (beside wave (flip-vert wave)))

(define side-by-side (beside einstein (flip-vert einstein)))
;; (paint side-by-side)

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter
                (below smaller smaller)))))

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter
                                  (- n 1))))
        (below painter
                (beside smaller smaller)))))

