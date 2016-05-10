(in-package :defpackage+-user-1)

(defpackage+ :gk.raw
  (:use #:cl #:alexandria #:autowrap.minimal #:plus-c #:gk.ffi)
  (:export-only

   ;; Library
   #:load-gk-library

   ;; Core API
   #:destroy-object #:destroy

   ;; Types
   #:cmd-type #:cmd-key
   #:make-gk-bundle
   #:set-bundle-list
   #:make-gk-list #:init-gk-list
   #:init-gk-cmd
   #:set-list-cmd
   #:make-gk-pass

   ;; Paths
   #:make-path #:make-gk-cmd-path

   ;; NanoVG
   #:make-gk-list-nvg

   #:make-gk-cmd-font-create
   #:make-gk-cmd-font-face
   #:make-gk-cmd-font-style
   #:gk-cmd-font-create-id
   #:make-gk-cmd-text

   #:make-gk-cmd-image-create

   ;; Transforms
   #:gk-vec2 #:gk-vec3 #:gk-vec4 #:gk-mat4
   #:make-gk-cmd-tf-trs #:gk-trs-mask
   #:make-gk-cmd-tf-ortho

   #:+identity-mat4+

   ;; GL
   #:make-gk-cmd-quad
   #:make-gk-cmd-quadsprite

   ;; Spritesheet
   #:make-gk-cmd-spritesheet-create
   #:make-gk-cmd-spritesheet-destroy)
  (:inherit :gk.ffi))

