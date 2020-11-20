#lang sicp
;; Ex. 1-19

;; Talk to Vikki
(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (* 2 (expt q 2))  ;compute p'
                   (+ (* 2 p q)
		      (expt q 2))  ;compute q'
                   (/ count 2)))
        (else 
         (fib-iter (+ (* b q) 
                      (* a q) 
                      (* a p))
                   (+ (* b p) 
                      (* a q))
                   p
                   q
                   (- count 1)))))

(fib 23)

;; Long-winded explanation of why this works
;; we know, from the book, how to do this transformation once using the following function:
;; f(a, b) = ((bq + aq + ap), (bp + aq)) -- which we can reduce, slightly to:
;; f(a, b) = ((bq + a(q + p)), (bp + aq))
;; NOTE - I use f(a, b) instead of T(a, b) because did not make the same intuitive sense to me
;; the above transformation basically gives you a value "p" and a value "q" that you can plug in
;; to determine how the transformation works one time

;; however, we want to be able to do this transformation twice because this will
;; help us get the benefit of completing the entire procedure in O(log n) steps
;; how can we do this function twice?
;; or another way of thinking about it:
;; if subbing in p and q did the job once, what values "p'" and "q'" would we need to sub in
;; to do the job twice?

;; to do the transformation twice essentially means:
;; f(f(a,b))
;; we know how to do it once by doing our single transformation:
;; f((bq + aq + ap), (bp + aq))
;; now we need to do it a second time:
;; ((bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p), ((bp + aq)p + (bq + aq + ap)q)
;; now reduce it
;; (bpq + aq^2 + bq^2 + aq^2 + apq + bpq + apq + ap^2), (bp^2 + apq + bp^2 + aq^2 + apq)
;; (2bpq + bq^2 + 2aq^2 + 2apq + ap^2), (2bp^2 + 2apq + aq^2)
;; note that we can reduce it to a "p'" and a "q'" that fit our transformation but do it twice
;; (b(2pq + q^2) + a(2pq + p^2) + a(2q^2)), (b(2p^2) + a(2pq + q^2))
;; (b(    q'   ) + a(    q'   ) + a( p' )), (b( p')  + a(    q'   ))
;; note how it mirrors (bq + aq + ap, bp + aq)

;; we can now use these values when we want to do the transformation twice (see the program above)
