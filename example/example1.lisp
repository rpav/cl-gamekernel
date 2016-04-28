(in-package :gk.test.example1)

(defclass gk-window (kit.sdl2:gl-window)
  (gk bundle list-nvg path-cmd font-cmd font-style-cmd text-cmd))

(defmethod initialize-instance :after ((w gk-window) &key &allow-other-keys)
  (with-slots (gk bundle list-nvg path-cmd
               font-cmd font-style-cmd text-cmd)
      w
    (setf gk (gk-create :gl3))
    (setf bundle (make-gk-bundle 0))
    (setf list-nvg (make-gk-list-nvg 1280 720 :prealloc 4))

    (let* ((path (list
                  :begin
                  :rect 100 100 120 30
                  :circle 120 120 5
                  :winding +gk-winding-hole+
                  :fill-color-rgba 255 192 0 255
                  :fill
                  :fill-color-rgba 0 0 255 255))
           (vec (make-path path))
           (font-file (namestring
                       (autowrap:asdf-path :gamekernel/examples "black_chancery.ttf"))))
      (setf path-cmd (make-gk-cmd-path vec (length path)))
      (setf font-cmd (make-gk-cmd-font-create "font" font-file))
      (setf font-style-cmd
            (make-gk-cmd-font-style :size 50))
      (setf text-cmd (make-gk-cmd-text "hello lisp" :x 100 :y 300))
      (set-bundle-list bundle 0 list-nvg)
      (set-list-cmd list-nvg 0 path-cmd)
      (set-list-cmd list-nvg 1 font-cmd)
      (set-list-cmd list-nvg 2 font-style-cmd)
      (set-list-cmd list-nvg 3 text-cmd))))

(defmethod kit.sdl2:close-window :before ((w gk-window))
  (with-slots (gk bundle list-nvg path-cmd
               font-cmd font-style-cmd text-cmd)
      w
    (destroy gk bundle list-nvg path-cmd
                font-cmd font-style-cmd text-cmd)))

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
    (gk-process gk bundle)))

(defun example ()
  (kit.sdl2:start)
  (sdl2:in-main-thread ()
    (sdl2:gl-set-attr :context-major-version 3)
    (sdl2:gl-set-attr :context-minor-version 3)
    (sdl2:gl-set-attr :context-profile-mask 1)
    (sdl2:gl-set-attr :stencil-size 8))
  (make-instance 'gk-window :w 1280 :h 720))

;;; (example)
