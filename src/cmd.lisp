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
 (cmd-spritesheet-destroy . make-gk-cmd-spritesheet-destroy)
 (cmd-b2-world-create . make-gk-cmd-b2-world-create)
 (cmd-b2-world-destroy . make-gk-cmd-b2-world-destroy)
 (cmd-b2-body-update . make-gk-cmd-b2-body-update)
 (cmd-b2-body-destroy . make-gk-cmd-b2-body-destroy)
 (cmd-b2-fixture-update . make-gk-cmd-b2-fixture-update)
 (cmd-b2-step . make-gk-cmd-b2-step)
 (cmd-b2-iter-bodies . make-gk-cmd-b2-iter-bodies)
 (cmd-b2-force . make-gk-cmd-b2-force)
 (cmd-b2-torque . make-gk-cmd-b2-torque)
 (cmd-b2-linear-impulse . make-gk-cmd-b2-linear-impulse)
 (cmd-b2-angular-impulse . make-gk-cmd-b2-angular-impulse)
 (cmd-b2-set-velocity . make-gk-cmd-b2-set-velocity)
 (cmd-b2-draw-debug . make-gk-cmd-b2-draw-debug)
 (make-b2-world . make-gk-b2-world)
 (b2-bodydef . make-gk-b2-bodydef))

 ;; Paths

(defun cmd-path (list &key key)
  (let ((vec (make-path list)))
    (make-gk-cmd-path vec (length list) :key key)))

(defun cmd-path-elt (cmd elt)
  (c-val ((cmd gk-cmd-path))
    (when (< elt (cmd :pathlen))
      (cmd :pathdef * elt))))

(defun (setf cmd-path-elt) (v cmd elt)
  (c-val ((cmd gk-cmd-path))
    (when (< elt (cmd :pathlen))
      (setf (cmd :pathdef * elt) v))))

 ;; Images

(defun image-create-id (cmd)
  (c-ref cmd gk-cmd-image-create :id))

(defun cmd-image-destroy (ids &key (key 0))
  (c-val ((cmd gk-cmd-image-destroy
               (make-gk-cmd-image-destroy :prealloc (length ids) :key key)))
    (loop for id in ids
          for i from 0
          do (setf (cmd :ids i) id))
    cmd))

 ;; Quadvert

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

(define-simple-accessor gk-cmd-text cmd-text :break-width)
(define-simple-accessor gk-cmd-text cmd-text (:pos :x))
(define-simple-accessor gk-cmd-text cmd-text (:pos :y))

(defun cmd-text-string (cmd)
  (c-val ((cmd gk-cmd-text))
    (cmd :str)))

(defun (setf cmd-text-string) (v cmd)
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
        (setf (cmd :flags) (logandc1 (mask 'gk-trs-mask :scale) (cmd :flags)))
        (progn
          (setf (cmd :flags) (logior (mask 'gk-trs-mask :scale) (cmd :flags)))
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
