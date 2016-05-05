(in-package :gk)

(defmacro define-simple-accessor (type prefix field)
  (let* ((short-field (if (listp field)
                          (lastcar field)
                          field))
         (field-list (if (listp field)
                         field
                         (list field)))
         (fname (symbolicate prefix "-" short-field)))
    `(progn
       (defun ,fname (,prefix)
         (c-ref ,prefix ,type ,@field-list))
       (defun (setf ,fname) (v ,prefix)
         (setf (c-ref ,prefix ,type ,@field-list) v)))))

(defmacro rebind (&rest funs)
  `(progn
     ,@(loop for list in funs
             collect `(setf (symbol-function ',(car list)) #',(cdr list)))))

(rebind
 (pass . make-gk-pass)
 (cmd-font-create . make-gk-cmd-font-create)
 (cmd-font-face . make-gk-cmd-font-face)
 (cmd-font-style . make-gk-cmd-font-style)
 (cmd-text . make-gk-cmd-text)
 (cmd-image-create . make-gk-cmd-image-create)
 (cmd-tf-trs . make-gk-cmd-tf-trs)
 (cmd-tf-ortho . make-gk-cmd-tf-ortho)
 (cmd-quad . make-gk-cmd-quad)
 (cmd-spritesheet-create . make-gk-cmd-spritesheet-create)
 (cmd-spritesheet-destroy . make-gk-cmd-spritesheet-destroy))

(defun cmd-path (list &key key)
  (let ((vec (make-path list)))
    (make-gk-cmd-path vec (length list) :key key)))

(defun image-create-id (cmd)
  (c-ref cmd gk-cmd-image-create :id))

 ;; Vectors etc

(defun vx (vec) (c-ref vec gk-vec2 :x))
(defun vy (vec) (c-ref vec gk-vec2 :y))
(defun vz (vec) (c-ref vec gk-vec3 :z))
(defun vw (vec) (c-ref vec gk-vec4 :w))

(defun (setf vx) (v vec) (setf (c-ref vec gk-vec2 :x) v))
(defun (setf vy) (v vec) (setf (c-ref vec gk-vec2 :y) v))
(defun (setf vz) (v vec) (setf (c-ref vec gk-vec3 :z) v))
(defun (setf vw) (v vec) (setf (c-ref vec gk-vec4 :w) v))

(defun set-vec2 (dest src)
  (memcpy dest src :type 'gk-vec2))

(defun set-vec3 (dest src)
  (memcpy dest src :type 'gk-vec3))

(defun set-vec4 (dest src)
  (memcpy dest src :type 'gk-vec4))

(defun set-vec2f (v2 x y)
  (setf (vx v2) x)
  (setf (vy v2) y))

(defun set-vec3f (v3 x y z)
  (setf (vx v3) x)
  (setf (vy v3) y)
  (setf (vz v3) z))

(defun set-vec4f (v4 x y z w)
  (setf (vx v4) x)
  (setf (vy v4) y)
  (setf (vz v4) z)
  (setf (vw v4) w))

;;; These are probably not amazingly fast, but are there for simple
;;; utility
(declaim (inline nv2+ nv3+ nv4+ nv2* nv3* nv4*))
(defun nv2+ (v0 v1)
  (incf (vx v0) (vx v1))
  (incf (vy v0) (vy v1)))

(defun nv3+ (v0 v1)
  (incf (vx v0) (vx v1))
  (incf (vy v0) (vy v1))
  (incf (vz v0) (vz v1)))

(defun nv4+ (v0 v1)
  (incf (vx v0) (vx v1))
  (incf (vy v0) (vy v1))
  (incf (vz v0) (vz v1))
  (incf (vw v0) (vw v1)))

(defun nv2* (v0 f)
  (setf (vx v0) (* (vx v0) f))
  (setf (vy v0) (* (vy v0) f)))

(defun nv3* (v0 f)
  (setf (vx v0) (* (vx v0) f))
  (setf (vy v0) (* (vy v0) f))
  (setf (vz v0) (* (vz v0) f)))

(defun nv4* (v0 f)
  (setf (vx v0) (* (vx v0) f))
  (setf (vy v0) (* (vy v0) f))
  (setf (vz v0) (* (vz v0) f))
  (setf (vw v0) (* (vw v0) f)))

(defun qv-vertex (quadvert) (c-ref quadvert gk-quadvert :vertex))
(defun qv-uv (quadvert) (c-ref quadvert gk-quadvert :uv))

(defun (setf qv-vertex) (vec4 qv)
  (memcpy (c-ref qv gk-quadvert :vertex &) vec4)
  vec4)

(defun (setf qv-uv) (vec2 qv)
  (memcpy (c-ref qv gk-quadvert :uv &) vec2)
  vec2)

 ;; Fonts

(defun font-create-name (cmd)
  (c-ref cmd gk-cmd-font-create :name))

(defun font-create-id (cmd)
  (c-ref cmd gk-cmd-font-create :id))

(define-simple-accessor gk-cmd-font-style font-style :size)
(define-simple-accessor gk-cmd-font-style font-style :blur)
(define-simple-accessor gk-cmd-font-style font-style :spacing)
(define-simple-accessor gk-cmd-font-style font-style :line-height)

(defun font-style-align (cmd)
  (c-val ((cmd gk-cmd-font-style))
    (mask-keywords 'gk-align-mask (cmd :align))))

(defun (setf font-style-align) (v cmd)
  (c-val ((cmd gk-cmd-font-style))
    (setf (cmd :align)
          (mask-apply 'gk-cmd-font-style v))))

 ;; Text

(define-simple-accessor gk-cmd-text text :break-width)
(define-simple-accessor gk-cmd-text text (:pos :x))
(define-simple-accessor gk-cmd-text text (:pos :y))

(defun text-string (cmd)
  (c-val ((cmd gk-cmd-text))
    (cmd :str)))

(defun (setf text-string) (v cmd)
  (c-val ((cmd gk-cmd-text))
    (unless (cffi:null-pointer-p (cmd :str * &))
      (free (cmd :str * &)))
    (setf (cmd :str) (string v))))

 ;; Transforms

(define-simple-accessor gk-cmd-tf-trs tf-trs (:parent :prior))

(defun tf-trs-translate (tf-trs)
  (c-ref tf-trs gk-cmd-tf-trs :translate))

(defun (setf tf-trs-translate) (v tf-trs)
  (declare (type (or gk-vec2 gk-vec3 null) v))
  (c-let ((cmd gk-cmd-tf-trs :from tf-trs))
    (if (null v)
        (memcpy (cmd :translate) (gk-vec3 0 0 0))
        (memcpy (cmd :translate) v)))
  v)

(defun tf-trs-axis (tf-trs)
  (c-ref tf-trs gk-cmd-tf-trs :axis))

(defun (setf tf-trs-axis) (v tf-trs)
  (c-let ((cmd gk-cmd-tf-trs :from tf-trs))
    (if (null v)
        (setf (cmd :flags) (logandc1 (mask 'gk-trs-mask :rotate) (cmd :flags)))
        (progn
          (setf (cmd :flags) (logior (mask 'gk-trs-mask :rotate) (cmd :flags)))
          (memcpy (cmd :axis &) v))))
  v)

(define-simple-accessor gk-cmd-tf-trs tf-trs :angle)

(defun tf-trs-scale (tf-trs)
  (c-ref tf-trs gk-cmd-tf-trs :scale))

(defun (setf tf-trs-scale) (v tf-trs)
  (c-let ((cmd gk-cmd-tf-trs :from tf-trs))
    (if (null v)
        (setf (cmd :flags) (logandc1 (mask 'gk-trs-mask :rotate) (cmd :flags)))
        (progn
          (setf (cmd :flags) (logior (mask 'gk-trs-mask :rotate) (cmd :flags)))
          (memcpy (cmd :scale &) v))))
  v)

 ;; quads

(define-simple-accessor gk-cmd-quad quad :tex)

(defun quad-tfm (cmd-quad)
  (c-ref cmd-quad gk-cmd-quad :tfm))

(defun quad-attr (cmd-quad i)
  (when (and (> i 0) (< i 4))
    (c-ref cmd-quad gk-cmd-quad :attr i)))

(defun (setf quad-attr) (v cmd-quad)
  (c-let ((cmd gk-cmd-quad :from cmd-quad))
    (loop for i from 0 upto 3
          for qv in v
          do (memcpy (cmd :attr i) qv)))
  v)

(define-simple-accessor gk-cmd-quadsprite quadsprite :index)
(define-simple-accessor gk-cmd-quadsprite quadsprite :sheet)

(defun quadsprite-tfm (cmd-quadsprite)
  (c-ref cmd-quadsprite gk-cmd-quadsprite :tfm))
