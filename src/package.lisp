(in-package :defpackage+-user-1)

(defpackage+ :gk
  (:use #:cl #:alexandria #:autowrap.minimal #:plus-c #:gk.raw)
  (:inherit-from
   :gk.raw

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
   #:cmd-path #:cmd-font-create #:cmd-font-style #:cmd-text
   #:cmd-image-create #:cmd-quad #:cmd-quadsprite
   #:cmd-tf-trs #:cmd-tf-ortho

   #:cmd-spritesheet-create #:cmd-spritesheet-destroy

   ;; Spritesheet
   #:spritesheet #:make-sheet #:make-sheet-destroy
   #:map-spritesheet #:find-frame

   ;; Accessors
   #:image-create-id #:font-create-id #:font-create-name
   #:quad-tex #:quad-tfm #:quad-attr

   #:vx #:vy #:vz #:vw
   #:nv2+ #:nv3+ #:nv4+ #:nv2* #:nv3* #:nv4*
   #:set-vec2 #:set-vec3 #:set-vec4
   #:set-vec2f #:set-vec3f #:set-vec4f

   #:qv-vertex #:qv-uv
   #:tf-trs-prior #:tf-trs-translate
   #:tf-trs-axis #:tf-trs-angle
   #:tf-trs-scale

   #:quadsprite-index #:quadsprite-sheet #:quadsprite-tfm
   ))

(in-package :gk)

 ;; Variables
