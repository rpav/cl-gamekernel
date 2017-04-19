(in-package :gk.test.example4)

(defclass gk-window (kit.sdl2.test:test-window)
  (gk bundle list world body ground step debug-draw go))

(defmethod initialize-instance :after ((w gk-window) &key &allow-other-keys)
  (with-slots (gk bundle list world body ground step debug-draw go) w
    (setf gk (gk:create :gl3))
    (setf bundle (make-instance 'bundle))
    (setf list (make-instance 'cmd-list-b2))
    (setf world (make-b2-world))
    (setf body (make-b2-body))
    (setf ground (make-b2-body))

    (setf step (cmd-b2-step world))
    (setf debug-draw (cmd-b2-draw-debug world 1280 720))

    (setf go t)

    (bundle-append bundle list)

    (let* ((world-create (cmd-b2-world-create world :gravity (gk-vec2 0.0 -9.8)))
           (bodydef (b2-bodydef body :dynamic))
           (fixdef (list
                    :begin
                    :rect 1.5 2.0 1.0 1.0
                    :density 1.0
                    :elasticity 0.5
                    :fill

                    :begin
                    :circle 1.5 2.0 0.5
                    :density 0.5
                    :elasticity 0.5
                    :fill

                    :begin
                    :circle 1.5 2.0 2.0
                    :sensor
                    :fixture-id 1.0
                    :fill))
           (fixture-create (cmd-b2-fixture-create body fixdef))

           (bdef-ground (b2-bodydef ground :static))
           (fix-ground (list
                        :begin
                        :rect 0.0 0.2 4.0 0.1
                        :fill))
           (body-create (cmd-b2-body-create world bodydef bdef-ground))
           (fix-create-ground (cmd-b2-fixture-create ground fix-ground)))
      (cmd-list-append list
                       world-create body-create fixture-create fix-create-ground)
      (gk:process gk bundle))

    (cmd-list-clear list)
    (cmd-list-append list step debug-draw)

    (sdl2:gl-set-swap-interval 1)
    (setf (kit.sdl2:idle-render w) t)))

(defmethod kit.sdl2:render ((w gk-window))
  (with-slots (gk bundle go) w
    (gl:clear-color 0.0 0.0 0.0 1.0)
    (gl:clear :color-buffer-bit :stencil-buffer-bit)
    (when go
      (gk:process gk bundle))))

#++
(defmethod kit.sdl2:keyboard-event ((w gk-window) state ts rp ks)
  #++
  (let ((scancode (sdl2:scancode ks)))
    (with-slots (go) w
      (when (eq :scancode-space scancode)
        (setf go t)))))

(defun example ()
  (kit.sdl2:start)
  (sdl2:in-main-thread ()
    (sdl2:gl-set-attr :context-major-version 3)
    (sdl2:gl-set-attr :context-minor-version 3)
    (sdl2:gl-set-attr :context-profile-mask 1)
    (sdl2:gl-set-attr :stencil-size 8))
  (make-instance 'gk-window :w 1280 :h 720))

;;; (example)
