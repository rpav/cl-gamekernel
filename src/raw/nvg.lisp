(in-package :gk.raw)

 ;; GK-LIST-NVG

(defmethod destroy-object ((l gk-list-nvg))
  (autocollect-cancel l)
  (free-gk-list (invalidate l)))

(defun make-gk-list-nvg (width height &key (prealloc 1) (ratio (float (/ width height))))
  (c-let ((l gk-list-nvg :calloc t))
    (init-gk-list l :nvg prealloc)
    (setf (l :width) width)
    (setf (l :height) height)
    (setf (l :ratio) ratio)
    l))

 ;; GK-CMD-FONT-CREATE

(defun free-gk-cmd-font-create (ptr)
  (c-let ((cmd gk-cmd-font-create :ptr ptr))
    (free (cmd :name * &))
    (free (cmd :filename * &))
    (free ptr)))

(defmethod destroy-object ((cmd gk-cmd-font-create))
  (autocollect-cancel cmd)
  (free-gk-cmd-font-create (invalidate cmd)))

(defun make-gk-cmd-font-create (name filename &key key)
  (c-let ((cmd gk-cmd-font-create :calloc t))
    (autocollect (ptr) cmd
      (free-gk-cmd-font-create ptr))
    (when key (setf (cmd :parent :key) key))
    (setf (cmd :parent :type) :font-create
          (cmd :name) name
          (cmd :filename) (namestring filename))
    cmd))

(defun gk-cmd-font-create-id (font-create-cmd)
  (c-let ((cmd gk-cmd-font-create :from font-create-cmd))
    (cmd :id)))

 ;; GK-CMD-FONT-FACE

(defun free-gk-cmd-font-face (ptr)
  (c-let ((cmd gk-cmd-font-face :ptr ptr))
    (when (= (cmd :type) +gk-font-face-name+)
      (free (cmd :face :name * &)))))

(defmethod destroy-object ((cmd gk-cmd-font-face))
  (autocollect-cancel cmd)
  (free-gk-cmd-font-face (ptr cmd)))

(defun make-gk-cmd-font-face (id-or-name &key key)
  (c-let ((cmd gk-cmd-font-face :calloc t))
    (init-gk-cmd cmd :font-face key)
    (autocollect (ptr) cmd
      (free-gk-cmd-font-face ptr))
    (etypecase id-or-name
      (number
       (setf (cmd :type) +gk-font-face-id+
             (cmd :face :id) id-or-name))
      (string
       (setf (cmd :type) +gk-font-face-name+
             (cmd :face :name) id-or-name)))
    cmd))

 ;; GK-CMD-FONT-STYLE

(defmethod destroy-object ((cmd gk-cmd-font-style))
  (autocollect-cancel cmd)
  (free (invalidate cmd)))

(autowrap:define-bitmask-from-enum (gk-align-mask gk-align))

(defun make-gk-cmd-font-style (&key size blur spacing line-height align key)
  (c-let ((cmd gk-cmd-font-style :calloc t))
    (autocollect (ptr) cmd
      (free ptr))
    (setf (cmd :parent :type) :font-style)
    (when key (setf (cmd :parent :key) key))
    (when size (setf (cmd :size) (float size)))
    (when blur (setf (cmd :blur) (float blur)))
    (when spacing (setf (cmd :spacing) (float spacing)))
    (when line-height (setf (cmd :line-height) (float line-height)))
    (when align
      (setf (cmd :align)
            (mask-apply 'gk-align-mask align)))
    cmd))

 ;; GK-CMD-TEXT

(defun free-gk-cmd-text (ptr)
  (c-let ((cmd gk-cmd-text :ptr ptr))
    (unless (cffi:null-pointer-p (cmd :str * &))
      (free (cmd :str * &)))
    (free ptr)))

(defmethod destroy-object ((cmd gk-cmd-text))
  (autocollect-cancel cmd)
  (free-gk-cmd-text (invalidate cmd)))

(defun make-gk-cmd-text (string &key break-width x y end key)
  (c-let ((cmd gk-cmd-text :calloc t))
    (autocollect (ptr) cmd
      (free-gk-cmd-text ptr))
    (when key (setf (cmd :parent :key) key))
    (setf (cmd :parent :type) :text
          (cmd :break-width) (float (or break-width 0))
          (cmd :pos :x) (float (or x 0s0))
          (cmd :pos :y) (float (or y 0s0)))
    (when string
      (setf (cmd :str) string))
    (when end
      (setf (cmd :end)
            (cffi-sys:inc-pointer (cmd :str * &) end)))
    cmd))

 ;; GK-CMD-IMAGE-CREATE

(autowrap:define-bitmask-from-enum (gk-tex-flags gk-tex-flags))

(defun free-gk-cmd-image-create (ptr)
  (c-let ((cmd gk-cmd-image-create :ptr ptr))
    (free (cmd :filename * &))
    (free ptr)))

(defmethod destroy-object ((cmd gk-cmd-image-create))
  (autocollect-cancel cmd)
  (free-gk-cmd-image-create (invalidate cmd)))

(defun make-gk-cmd-image-create (filename &key flags (min :linear) (mag :linear) key)
  (c-let ((cmd gk-cmd-image-create :calloc t))
    (autocollect (ptr) cmd
      (free-gk-cmd-image-create ptr))
    (when key (setf (cmd :parent :key) key))
    (setf (cmd :parent :type) :image-create
          (cmd :filename) (namestring filename)
          (cmd :flags) (autowrap:mask-apply 'gk-tex-flags flags)
          (cmd :min-filter) min
          (cmd :mag-filter) mag)
    cmd))
