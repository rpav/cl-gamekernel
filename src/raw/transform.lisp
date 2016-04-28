(in-package :gk.raw)

(autowrap:define-bitmask-from-enum (gk-trs-mask gk-trs-flags))

(simply-destroy gk-vec2 gk-vec3 gk-vec4 gk-mat4 gk-quadvert)

(defun gk-vec2 (x y)
  (c-let ((v gk-vec2))
    (autocollect (ptr) v (free ptr))
    (setf (v :x) (float x)
          (v :y) (float y))
    v))

(defmethod print-object ((o gk-vec2) s)
  (print-unreadable-object (o s :type t)
    (c-let ((v gk-vec2 :from o))
      (format s "[~S ~S]" (v :x) (v :y)))))

(defun gk-vec3 (x y z)
  (c-let ((v gk-vec3))
    (autocollect (ptr) v (free ptr))
    (setf (v :x) (float x)
          (v :y) (float y)
          (v :z) (float z))
    v))

(defmethod print-object ((o gk-vec3) s)
  (print-unreadable-object (o s :type t)
    (c-let ((v gk-vec3 :from o))
      (format s "[~S ~S ~S]" (v :x) (v :y) (v :z)))))

(defun gk-vec4 (x y z w)
  (c-let ((v gk-vec4))
    (autocollect (ptr) v (free ptr))
    (setf (v :x) (float x)
          (v :y) (float y)
          (v :z) (float z)
          (v :w) (float w))
    v))

(defmethod print-object ((o gk-vec4) s)
  (print-unreadable-object (o s :type t)
    (c-let ((v gk-vec4 :from o))
      (format s "[~S ~S ~S ~S]" (v :x) (v :y) (v :z) (v :w)))))

(defun gk-mat4 (&optional
                (a00 1.0) (a10 0.0) (a20 0.0) (a30 0.0)
                (a01 0.0) (a11 1.0) (a21 0.0) (a31 0.0)
                (a02 0.0) (a12 0.0) (a22 1.0) (a32 0.0)
                (a03 0.0) (a13 0.0) (a23 0.0) (a33 1.0))
  (c-let ((m gk-mat4))
    (autocollect (ptr) m (free ptr))
    (setf (m :v :a00) (float a00) (m :v :a10) (float a10) (m :v :a20) (float a20) (m :v :a30) (float a30)
          (m :v :a01) (float a01) (m :v :a11) (float a11) (m :v :a21) (float a21) (m :v :a31) (float a31)
          (m :v :a02) (float a02) (m :v :a12) (float a12) (m :v :a22) (float a22) (m :v :a32) (float a32)
          (m :v :a03) (float a03) (m :v :a13) (float a13) (m :v :a23) (float a23) (m :v :a33) (float a33))
    m))

(defvar +IDENTITY-MAT4+ (gk-mat4))

(defmethod print-object ((o gk-mat4) s)
  (print-unreadable-object (o s :type t)
    (c-let ((m gk-mat4 :from o))
      (format s "{#x~X}~%  [~S ~S ~S ~S]~%  [~S ~S ~S ~S]~%  [~S ~S ~S ~S]~%  [~S ~S ~S ~S]"
              (cffi:pointer-address (ptr o))
              (m :v :a00) (m :v :a10) (m :v :a20) (m :v :a30)
              (m :v :a01) (m :v :a11) (m :v :a21) (m :v :a31)
              (m :v :a02) (m :v :a12) (m :v :a22) (m :v :a32)
              (m :v :a03) (m :v :a13) (m :v :a23) (m :v :a33)))))

(defun gk-quadvert (x y z w u v)
  (c-let ((qv gk-quadvert))
    (autocollect (ptr) qv (free ptr))
    (setf (qv :vertex :x) (float x)
          (qv :vertex :y) (float y)
          (qv :vertex :z) (float z)
          (qv :vertex :w) (float w)
          (qv :uv :x) (float u)
          (qv :uv :y) (float v))
    qv))

(defmethod print-object ((o gk-quadvert) s)
  (print-unreadable-object (o s :type t)
    (c-let ((qv gk-quadvert :from o))
      (format s "V:[~S ~S ~S ~S] UV:[~S ~S]"
              (qv :vertex :x) (qv :vertex :y) (qv :vertex :z) (qv :vertex :w)
              (qv :uv :x) (qv :uv :y)))))

(simply-destroy gk-cmd-tf-trs)

(defun make-gk-cmd-tf-trs (&key key prior out translate axis angle scale)
  (c-let ((cmd gk-cmd-tf-trs))
    (autocollect (ptr) cmd (free ptr))
    (setf (cmd :parent :parent :type) :tf-trs)
    (when key (setf (cmd :parent :parent :key) key))
    (let ((flags))
      (when axis (push :rotate flags))
      (when scale (push :scale flags))
      (if prior
          (setf (cmd :parent :prior) (ptr prior))
          (setf (cmd :parent :prior) (cffi:null-pointer)))
      (if out
          (setf (cmd :parent :out) (ptr out))
          (setf (cmd :parent :out) (cffi:null-pointer)))
      (setf (cmd :flags) (mask-apply 'gk-trs-mask flags))
      (when translate (memcpy (cmd :translate) translate))
      (when axis (memcpy (cmd :axis) axis))
      (when angle (setf (cmd :angle) angle))
      (when scale (memcpy (cmd :scale) scale)))
    cmd))

(simply-destroy gk-cmd-tf-ortho)

(defun make-gk-cmd-tf-ortho (out left right bottom top near far
                             &key key)
  (c-let ((cmd gk-cmd-tf-ortho))
    (autocollect (ptr) cmd (free ptr))
    (when key (setf (cmd :parent :parent :key) key))
    (setf (cmd :parent :parent :type) :tf-ortho
          (cmd :parent :out) (ptr out)
          (cmd :left) (float left)
          (cmd :right) (float right)
          (cmd :bottom) (float bottom)
          (cmd :top) (float top)
          (cmd :near) (float near)
          (cmd :far) (float far))
    cmd))
