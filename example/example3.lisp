(in-package :gk.test.example3)

(defclass gk-window (kit.sdl2.test:test-window)
  (gk bundle list proj sheet sprite min-frame max-frame))

(defmethod initialize-instance :after ((w gk-window) &key &allow-other-keys)
  (with-slots (gk bundle proj list sheet sprite min-frame max-frame) w
    (setf gk (gk:create :gl3))
    (setf bundle (make-instance 'bundle :sort :asc))
    (setf proj (gk-mat4))

    (let* ((pre-load (make-instance 'bundle))
           (pre-list (make-instance 'cmd-list :subsystem :config))
           (sheet-cmd (cmd-spritesheet-create (autowrap:asdf-path :gamekernel/examples "platformer_sprites.json")
                                              :gk-ssf-texturepacker-json
                                              :flags '(:flip-y)))
           (ortho (cmd-tf-ortho proj 0 1280 0 720 -1 1)))
      (bundle-append pre-load pre-list)
      (cmd-list-append pre-list sheet-cmd ortho)
      (gk:process gk pre-load)
      (setf sheet (make-sheet sheet-cmd))
      (setf min-frame (find-frame sheet "walk_0.png")
            max-frame (find-frame sheet "walk_7.png")))

    (sdl2:gl-set-swap-interval 1)
    (setf sprite (make-instance 'sprite :sheet sheet :index min-frame
                   :pos (gk-vec3 64 64 0)))
    (setf list (make-instance 'cmd-list :subsystem :gl))
    (bundle-append bundle list)
    (setf (kit.sdl2:idle-render w) t)))

(defmethod kit.sdl2:render ((w gk-window))
  (gl:clear-color 0.0 0.0 0.0 1.0)
  (gl:clear :color-buffer-bit :stencil-buffer-bit)
  (with-slots (gk bundle list proj sprite min-frame max-frame) w
    (cmd-list-clear list)
    (draw sprite list proj)
    (incf (sprite-index sprite))
    (when (> (sprite-index sprite) max-frame)
      (setf (sprite-index sprite) min-frame))
    (gk:process gk bundle)))

(defmethod kit.sdl2:close-window :before ((w gk-window))
  (with-slots (gk sheet) w
    (let* ((b (make-instance 'bundle))
           (list (make-instance 'cmd-list :subsystem :config))
           (sheet-destroy (make-sheet-destroy sheet)))
      (bundle-append b list)
      (cmd-list-append list sheet-destroy )
      (gk:process gk b))
    (gk:destroy gk)))

(defun example ()
  (kit.sdl2:start)
  (sdl2:in-main-thread ()
    (sdl2:gl-set-attr :context-major-version 3)
    (sdl2:gl-set-attr :context-minor-version 3)
    (sdl2:gl-set-attr :context-profile-mask 1)
    (sdl2:gl-set-attr :stencil-size 8))
  (make-instance 'gk-window :w 1280 :h 720))

;;; (example)
