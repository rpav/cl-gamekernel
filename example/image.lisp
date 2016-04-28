(in-package :gk.test)

(defgeneric draw (thing list matrix)
  (:documentation "Draw `THING` into `LIST` with `MATRIX` as a prior
transformation"))

(defclass image ()
  (anchor quad trs))

(defmethod initialize-instance ((s image) &key key (tex 0) anchor size pos)
  (with-slots (quad trs scale) s
    (setf quad (cmd-quad tex :key (+ key 5000)))
    (setf trs (cmd-tf-trs :out (quad-tfm quad)
                          :translate pos
                          :scale size
                          :key key))
    (setf (image-anchor s) anchor)))

(defun image-tex (s)
  (quad-tex (slot-value s 'quad)))

(defun (setf image-tex) (v s)
  (setf (quad-tex (slot-value s 'quad)) v))

(defun image-pos (s)
  (tf-trs-translate (slot-value s 'trs)))

(defun (setf image-pos) (v s)
  (setf (tf-trs-translate (slot-value s 'trs)) v))

(defun image-anchor (image)
  (slot-value image 'anchor))

(defun (setf image-anchor) (v image)
  (with-slots (anchor quad) image
    (setf anchor v)
    (let* ((x- (- (vx v) 1))
           (x+ (vx v))
           (y- (- (vy v) 1))
           (y+ (vy v))
           (verts (list (gk-quadvert x- y- 0 1 0 0)
                        (gk-quadvert x+ y- 0 1 1 0)
                        (gk-quadvert x- y+ 0 1 0 1)
                        (gk-quadvert x+ y+ 0 1 1 1))))
      (setf (quad-attr quad) verts)))
  v)

(defmethod draw ((image image) list m)
  (with-slots (quad trs) image
    (setf (tf-trs-prior trs) m)
    (cmd-list-append list trs)
    (cmd-list-append list quad)))
