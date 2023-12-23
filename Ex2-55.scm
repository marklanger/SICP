#lang racket
(require sicp)
(require racket/trace)

;; Exercise 2.55

(car 'abracadabra) ;; Error - expects a pair
(car ''abracadabra) ;; quote
;; It looks like this is equivalent to '(quote abracadabra), which makes quote the car.

