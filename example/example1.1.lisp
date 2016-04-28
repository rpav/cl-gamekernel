(in-package :gk.test.example1.1)

(defparameter +font+
  (namestring
   (autowrap:asdf-path :gamekernel/examples "black_chancery.ttf")))

(defclass gk-window (kit.sdl2:gl-window)
  (gk bundle))

(defmethod initialize-instance :after ((w gk-window) &key &allow-other-keys)
  (with-slots (gk bundle) w
    (setf gk (gk:create :gl3))
    (setf bundle (make-instance 'bundle))

    (let* ((list (make-instance 'cmd-list-nvg
                   :width 1280
                   :height 720))
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
           (font-create (cmd-font-create "font" +font+))
           (font-style (cmd-font-style :size 100))
           (text (cmd-text "hello lisp 1.1" :x 100 :y 300)))
      (cmd-list-append list path font-create font-style text)
      (bundle-append bundle list))))

(defmethod kit.sdl2:close-window :before ((w gk-window))
  (with-slots (gk) w
    (gk:destroy gk)))

(defmethod kit.sdl2:textinput-event ((w gk-window) ts text)
  (when (string= "Q" (string-upcase text))
    (kit.sdl2:close-window w)))

(defmethod kit.sdl2:keyboard-event ((window gk-window) state ts repeat-p keysym)
  (let ((scancode (sdl2:scancode keysym)))
    (when (eq :scancode-escape scancode)
      (kit.sdl2:close-window window))))

(defmethod kit.sdl2:render ((w gk-window))
  (gl:clear-color 0.0 0.0 0.0 1.0)
  (gl:clear :color-buffer-bit :stencil-buffer-bit)
  (with-slots (gk bundle) w
    (gk:process gk bundle)))

(defun example ()
  (kit.sdl2:start)
  (sdl2:in-main-thread ()
    (sdl2:gl-set-attr :context-major-version 3)
    (sdl2:gl-set-attr :context-minor-version 3)
    (sdl2:gl-set-attr :context-profile-mask 1)
    (sdl2:gl-set-attr :stencil-size 8))
  (make-instance 'gk-window :w 1280 :h 720))

;;; (example)
