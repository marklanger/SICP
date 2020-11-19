;; Exercise 1-10
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10) ;; 1024
(A 2 4) ;; 65536
(A 3 3) ;; 65536

(define (f n) (A 0 n)) ;; 2n
(define (g n) (A 1 n)) ;; I don't know
(define (h n) (A 2 n)) ;; I don't know

;; Technically, it should be this, but I don't know how to parse it
;; (g n): 0 for n=0, 2^{n} for n>0
;; (h n): 0 for n=0, 2 for n=1, 2^2^… (n-1 times) for n>1
