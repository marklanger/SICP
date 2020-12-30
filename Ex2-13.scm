#lang racket
(require sicp)

;; Exercise 2.13

;; http://community.schemewiki.org/?sicp-ex-2.13
;;   a = [Ca*(1 - 0.5*Ta), Ca*(1 + 0.5*Ta)]

;;   b = [Cb*(1 - 0.5*Tb), Cb*(1 + 0.5*Tb)]

;; If the endpoints are positive, a*b has the endpoints (after simplifying):

;;   a*b = [Ca*Cb*(1 - 0.5*(Ta + Tb) + 0.25*Ta*Tb),
;;          Ca*Cb*(1 + 0.5*(Ta + Tb) + 0.25*Ta*Tb)]

;; If the tolerance is small enough, it is essentially:

;; [Ca*Cb*(1 - 0.5*(Ta + Tb),
;;  Ca*Cb*(1 + 0.5*(Ta + Tb)];

;; In other words, this is essentially the same as the sum of the component tolerances (Ta + Tb).
