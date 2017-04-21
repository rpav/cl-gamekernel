(in-package :defpackage+-user-1)

(defpackage+ :gk.raw
  (:use #:cl #:alexandria #:autowrap.minimal #:plus-c #:gk.ffi)
  (:export-only

   ;; Library, loading, initalization
   #:gk-init

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
   #:make-gk-cmd-image-destroy

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
   #:make-gk-cmd-spritesheet-destroy

   ;; Box2D
   #:gk-b2-world #:gk-b2-body
   #:make-gk-b2-world #:free-gk-b2-body #:make-gk-b2-body
   #:make-gk-b2-bodydef

   #:make-gk-cmd-b2-world-create
   #:make-gk-cmd-b2-world-destroy
   #:make-gk-cmd-b2-body-create
   #:make-gk-cmd-b2-body-update
   #:make-gk-cmd-b2-body-destroy
   #:make-gk-cmd-b2-fixture-create
   #:free-gk-cmd-b2-fixture-create
   #:make-gk-cmd-b2-fixture-update
   #:make-gk-cmd-b2-iter-bodies
   #:make-gk-cmd-b2-force
   #:make-gk-cmd-b2-torque
   #:make-gk-cmd-b2-linear-impulse
   #:make-gk-cmd-b2-angular-impulse
   #:make-gk-cmd-b2-set-velocity
   #:make-gk-cmd-b2-draw-debug
   #:make-gk-cmd-b2-step
   )
  (:inherit :gk.ffi))

