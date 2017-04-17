(defpackage+-1:defpackage+ :gk.test
  (:use #:cl #:alexandria #:gk)
  (:export-only
   #:example-1 #:example-1.1 #:example-2 #:example-3

   #:draw

   #:sprite #:sprite-pos #:sprite-index
   #:image #:image-anchor #:image-pos #:image-tex))

(defpackage+-1:defpackage+ :gk.test.example1
  (:use #:cl #:alexandria #:gk.raw))

(defpackage+-1:defpackage+ :gk.test.example1.1
  (:use #:cl #:alexandria #:gk))

(defpackage+-1:defpackage+ :gk.test.example2
  (:use #:cl #:alexandria #:gk #:gk.test))

(defpackage+-1:defpackage+ :gk.test.example3
  (:use #:cl #:alexandria #:gk #:gk.test))

(defpackage+-1:defpackage+ :gk.test.example4
  (:use #:cl #:alexandria #:gk #:gk.test))

(in-package :gk.test)

 ;; Variables

