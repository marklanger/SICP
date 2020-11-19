;; Exercise 1-11

(define (f x)
  (if (< x 3)
      x
      (+ (f (- x 1))
	 (f (* 2 (- x 2)))
	 (f (* 3 (- x 3))))))

(define (f2 n)
  (if (< n 3)
      n
      (f2-iter 2 1 0 3 n)))

(define (f2-iter x1 x2 x3 count n)
  (if (< n count)
      x1
      (f2-iter (+ x1 (* 2 x2) (* 3 x3)) x1 x2 (+ count 1) n)))
