(in-package :gk.test.example2)

(defclass gk-window (kit.sdl2.test:test-window)
  (gk bundle list proj
   (images :initform (make-array 1000))))

(defmethod initialize-instance :after ((w gk-window) &key &allow-other-keys)
  (let (tex)
   (with-slots (gk bundle proj list images) w
     (setf gk (gk:create :gl3))
     (setf bundle (make-instance 'bundle :sort :asc))
     (setf proj (gk-mat4))

     (let* ((pre-load (make-instance 'bundle))
            (pre-list (make-instance 'cmd-list :subsystem :config))
            (img (cmd-image-create (autowrap:asdf-path :gamekernel/examples "test.png")))
            (ortho (cmd-tf-ortho proj 0 1280 0 720 -1 1)))
       (bundle-append pre-load pre-list)
       (cmd-list-append pre-list img ortho)
       (gk:process gk pre-load)
       (setf tex (image-create-id img)))

     (loop for i from 0 below (length images)
           do (setf (aref images i)
                    (make-instance 'image
                      :key i
                      :tex tex
                      :anchor (gk-vec2 0.5 0.5)
                      :size (gk-vec3 64 64 0)
                      :pos (gk-vec4 (random 1280) (random 720) 0 1))))

     (setf list (make-instance 'cmd-list :subsystem :gl))
     (bundle-append bundle list)
     (setf (kit.sdl2:idle-render w) t))))

(defmethod kit.sdl2:render ((w gk-window))
  (gl:clear-color 0.0 0.0 0.0 1.0)
  (gl:clear :color-buffer-bit :stencil-buffer-bit)
  (with-slots (gk bundle list proj images) w
    (cmd-list-clear list)
    (loop for i from 0 below (length images)
          do (let* ((x (random 1280.0))
                    (y (random 720.0))
                    (image (aref images i)))
               (plus-c:c-val ((pos gk-vec3 (image-pos image)))
                 (setf (pos :x) x)
                 (setf (pos :y) y))
               (draw (aref images i) list proj)))
    (gk:process gk bundle)))

(defmethod kit.sdl2:close-window :before ((w gk-window))
  (with-slots (gk) w
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
