;; Exercise 1-16
;; Calculate b**n
;; using successive squaring

(define (fast-expt b n)
  (fast-expt-iter b n 1))

(define (fast-expt-iter num counter total)
  ;; (if (= counter 0)
  ;;     total
  ;;     (fast-expt-iter num (- counter 1) (* num total))))
  (cond ((= counter 0)
	 total)
	((not (even? counter))
	 (fast-expt-iter num (- counter 1) (* num total)))
	(else (fast-expt-iter num (/ counter 2) (* num num total)))))

(define (even? n)
  (= (remainder n 2) 0))
