(in-package :defpackage+-user-1)

(defpackage+ :gk
  (:use #:cl #:alexandria #:autowrap.minimal #:plus-c #:gk.raw)
  (:inherit-from
   :gk.raw

   #:gk-init
   #:cmd-key
   #:destroy

   #:gk-vec2 #:gk-vec3 #:gk-vec4 #:gk-mat4 #:gk-quadvert)
  (:inherit-from
   :gk.ffi
   #:+gk-winding-cw+ #:+gk-winding-ccw+
   #:+gk-winding-hole+ #:+gk-winding-solid+)
  (:export

   ;; Core
   #:create #:process

   ;; Bundles, command lists, passes
   #:bundle #:bundle-start #:bundle-sort #:with-bundle
   #:pass

   #:bundle-append #:bundle-clear
   #:cmd-list-append #:cmd-list-clear

   #:cmd-list
   #:cmd-list-nvg

   ;; Commands
   #:cmd-font-create #:cmd-font-face #:cmd-font-style
   #:cmd-path #:cmd-text
   #:cmd-image-create #:cmd-image-destroy #:cmd-quad #:cmd-quadsprite
   #:cmd-tf-trs #:cmd-tf-ortho

   #:cmd-spritesheet-create #:cmd-spritesheet-destroy

   #:cmd-b2-world-create #:cmd-b2-world-destroy
   #:cmd-b2-body-create #:cmd-b2-body-update #:cmd-b2-body-destroy
   #:cmd-b2-fixture-create #:cmd-b2-fixture-update
   #:cmd-b2-step #:cmd-b2-iter-bodies
   #:cmd-b2-force #:cmd-b2-torque
   #:cmd-b2-linear-impulse #:cmd-b2-angular-impulse
   #:cmd-b2-set-velocity
   #:cmd-b2-draw-debug #:make-b2-body #:make-b2-world #:b2-bodydef
   #:cmd-list-b2

   #:b2-body-update-body #:b2-body-update-translate #:b2-body-update-angle

   #:b2-fixture-update-density #:b2-fixture-update-elasticity
   #:b2-fixture-update-friction #:b2-fixture-update-mask

   #:b2-body-position #:b2-body-angle #:b2-body-is-awake
   #:b2-body-velocity #:b2-body-angular-velocity
   #:b2-body-user-data

   #:b2-force #:b2-force-point
   #:b2-torque
   #:b2-linear-impulse #:b2-linear-impulse-point
   #:b2-angular-impulse
   #:b2-velocity-linear #:b2-velocity-angular

   #:map-b2-collisions
   #:add-b2-body-object #:find-b2-body-object #:remove-b2-body-object
   #:clear-b2-body-objects

   ;; Spritesheet
   #:spritesheet #:make-sheet #:make-sheet-destroy
   #:map-spritesheet #:find-frame

   ;; Accessors
   #:cmd-path-elt
   #:image-create-id #:font-create-id #:font-create-name
   #:font-style-size #:font-style-blur #:font-style-spacing
   #:font-style-line-height #:font-style-align
   #:quad-tex #:quad-tfm #:quad-attr

   #:text-break-width #:text-x #:text-y #:text-string

   #:vx #:vy #:vz #:vw #:v2= #:v3= #:v4=
   #:nv2+ #:nv3+ #:nv4+ #:nv2- #:nv3- #:nv4- #:nv2* #:nv3* #:nv4*
   #:set-vec2 #:set-vec3 #:set-vec4
   #:set-vec2f #:set-vec3f #:set-vec4f
   #:len-v2^2 #:len-v3^2 #:len-v4^2 #:len-v2 #:len-v3 #:len-v4
   #:nnorm-v2 #:nnorm-v3 #:nnorm-v4

   #:qv-vertex #:qv-uv
   #:tf-trs-prior #:tf-trs-translate
   #:tf-trs-axis #:tf-trs-angle
   #:tf-trs-scale

   #:quadsprite-index #:quadsprite-sheet #:quadsprite-tfm
   ))

(in-package :gk)

 ;; Variables
