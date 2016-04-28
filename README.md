# cl-gamekernel

This is the Common Lisp wrapper for
[GameKernel](https://github.com/rpav/gamekernel).  It provides both
"raw" API and a slightly higher-level, lispy API.

Note that while this code is basically a "recipe code" demo for the
API, real code can modify commands, maintain lists, etc, as it likes.
Since lists and commands are *just data*, not FFI calls, there is
considerably less restriction about where and what thread they're
modified in.  Since GameKernel can also *sort* commands, they don't
even have to be queued in order!

```lisp
(defclass gk-window (kit.sdl2:gl-window)
  (gk bundle))

(defmethod initialize-instance :after ((w gk-window) &key &allow-other-keys)
  (with-slots (gk bundle) w
    ;; Create a GameKernel context
    (setf gk (gk:create :gl3))

    ;; The bundle holds all our commands etc
    (setf bundle (make-instance 'bundle))

    ;; A list holds commands for one subsystem (GL, NanoVG, ...)
    (let* ((list (make-instance 'cmd-list-nvg
                   :width 1280
                   :height 720))

           ;; A path processed by NanoVG is rasterized
           (path
             (cmd-path
              (list
               :begin
               :rect 100 100 120 30
               :circle 120 120 5
               :winding +gk-winding-hole+
               :fill-color-rgba 255 192 0 255
               :fill
               :fill-color-rgba 0 0 255 255)))

           ;; Fonts, images, etc can also be created in a CONFIG pass
           (font-create (cmd-font-create "font" +font+))
           (font-style (cmd-font-style :size 100))

           ;; A text command actually draws text
           (text (cmd-text "hello lisp 1.1" :x 100 :y 300)))

      ;; Pack everything up
      (cmd-list-append list path font-create font-style text)
      (bundle-append bundle list))))

(defmethod kit.sdl2:render ((w gk-window))
  (gl:clear-color 0.0 0.0 0.0 1.0)
  (gl:clear :color-buffer-bit :stencil-buffer-bit)
  (with-slots (gk bundle) w

    ;; GameKernel processes the bundle with _1_ FFI call
    (gk:process gk bundle)))

(defmethod kit.sdl2:close-window :before ((w gk-window))
  (with-slots (gk) w
    (gk:destroy gk)))
```

<img src="http://ogmo.mephle.net/gamekernel/cl-example1.1.png">

# API

Much like GameKernel itself, there are three primary functions.  Note,
all of these functions **must** be called with a valid GL context
active.  If you are using an sdl2kit `GL-WINDOW`, this happens
automatically in callback methods.

* `(gk:gk-create IMPL)`:  Currently only `:gl3` is implemented.  GL2.1 support should be added before too long.  This returns a GK context.
* `(gk:gk-process CONTEXT BUNDLE)`:  Process a bundle in a given context.  Note that cross-context bundles are not necessarily valid; many resources loaded or created are bound to a given GL or GK context.
* `(gk:destroy &rest OBJECTS)`:  Note the lack of `GK-`.  This is the protocol for destroying objects, including the context.  Merely freeing the context will *not* free all related resources, commands, lists, bundles, etc.  That's because those are intended, with some exception, to be managed client-side.  Many objects have finalizers which will let them be automatically collected.

Unlike the C API, however, `cl-gamekernel` provides a richer, more
friendly set of functions for dealing with commands, lists, bundles,
and related data.
