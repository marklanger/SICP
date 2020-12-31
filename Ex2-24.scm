#lang racket
(require sicp)

;; Exercise 2.24

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

(count-leaves (list 1 (list 2 (list 3 4)))) ;; 4

;; | (list 1 (list 2 (list 3 4))) |
;; | 1 |       (list 2 (list 3 4) |
;; |   |        2 |    (list 3 4) |
;; |   |          |    3       4  |

;; See SICP solutions (more patient than I am with ASCII art)
;; (1 (2 (3 4)))
;;      ^
;;    /   \
;;   1     ^ (2 (3 4))
;;       /   \
;;      2     ^ (3 4)
;;          /   \
;;         3     4

                                         
;; +---+---+  +---+---+
;; | * | *-+->| * | / |
;; +-+-+---+  +-+-+---+
;;   |          |   
;;   V          V      
;; +---+      +---+---+  +---+---+
;; | 1 |      | * | *-+->| * | / |
;; +---+      +-+-+---+  +---+---+
;;              |          |
;;              V          V
;;            +---+      +---+---+  +---+---+
;;            | 2 |      | * | *-+->| * | / |
;;            +---+      +-+-+---+  +-+-+---+
;;                         |          |
;;                         V          V
;;                       +---+      +---+
;;                       | 3 |      | 4 |
;;                       +---+      +---+
