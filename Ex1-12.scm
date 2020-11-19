;; Exercise 12

;;          (0,0)
;;            1
;;       (1,0) (1,1)
;;         1     1
;;    (2,0) (2,1) (2,2)
;;      1     2     1
;; (3,0) (3,1) (3,2) (3,3)
;;   1     3     3     1
;; 1    4     6     4    1


(define (pascal-finder row col)
  (if (or (= row col)
	  (= col 0))
      1
      (+ (pascal-finder (- row 1) (- col 1))
	 (pascal-finder (- row 1) col))))

(pascal-finder 4 2)


;; I am finding some weird way of working backward from
;; a specific instance, seeing how it works, and then
;; then making it generic seems to be working pretty
;; well.
