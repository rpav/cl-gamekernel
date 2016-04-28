(defpackage+-1:defpackage+ :gk.raw (:use #:cl))
(in-package :gk.raw)

(cffi:define-foreign-library libgk
  (:darwin (:or (:framework "gk") (:default "libgk")))
  (:unix "libgk.so")
  (:windows "gk.dll")
  (t (:default "libgk")))

;(cffi:close-foreign-library 'libgk)
(cffi:use-foreign-library libgk)
