(in-package :gk)

;;; Various vector functions etc for use with gk-vec[234].

(defun vx (vec) (c-ref vec gk-vec2 :x))
(defun vy (vec) (c-ref vec gk-vec2 :y))
(defun vz (vec) (c-ref vec gk-vec3 :z))
(defun vw (vec) (c-ref vec gk-vec4 :w))

(defun (setf vx) (v vec) (setf (c-ref vec gk-vec2 :x) v))
(defun (setf vy) (v vec) (setf (c-ref vec gk-vec2 :y) v))
(defun (setf vz) (v vec) (setf (c-ref vec gk-vec3 :z) v))
(defun (setf vw) (v vec) (setf (c-ref vec gk-vec4 :w) v))

(defun set-vec2 (dest src)
  (memcpy dest src :type 'gk-vec2)
  dest)

(defun set-vec3 (dest src)
  (memcpy dest src :type 'gk-vec3)
  dest)

(defun set-vec4 (dest src)
  (memcpy dest src :type 'gk-vec4)
  dest)

(defun set-vec2f (v2 x y)
  (setf (vx v2) x)
  (setf (vy v2) y)
  v2)

(defun set-vec3f (v3 x y z)
  (setf (vx v3) x)
  (setf (vy v3) y)
  (setf (vz v3) z)
  v3)

(defun set-vec4f (v4 x y z w)
  (setf (vx v4) x)
  (setf (vy v4) y)
  (setf (vz v4) z)
  (setf (vw v4) w)
  v4)

;;; These are probably not amazingly fast, but are there for simple
;;; utility
(declaim (inline nv2+ nv3+ nv4+ nv2- nv3- nv4- nv2* nv3* nv4*))
(defun nv2+ (v0 v1)
  (incf (vx v0) (vx v1))
  (incf (vy v0) (vy v1))
  v0)

(defun nv3+ (v0 v1)
  (incf (vx v0) (vx v1))
  (incf (vy v0) (vy v1))
  (incf (vz v0) (vz v1))
  v0)

(defun nv4+ (v0 v1)
  (incf (vx v0) (vx v1))
  (incf (vy v0) (vy v1))
  (incf (vz v0) (vz v1))
  (incf (vw v0) (vw v1))
  v0)

(defun nv2- (v0 v1)
  (decf (vx v0) (vx v1))
  (decf (vy v0) (vy v1))
  v0)

(defun nv3- (v0 v1)
  (decf (vx v0) (vx v1))
  (decf (vy v0) (vy v1))
  (decf (vz v0) (vz v1))
  v0)

(defun nv4- (v0 v1)
  (decf (vx v0) (vx v1))
  (decf (vy v0) (vy v1))
  (decf (vz v0) (vz v1))
  (decf (vw v0) (vw v1))
  v0)

(defun nv2* (v0 f)
  (setf (vx v0) (* (vx v0) f))
  (setf (vy v0) (* (vy v0) f))
  v0)

(defun nv3* (v0 f)
  (setf (vx v0) (* (vx v0) f))
  (setf (vy v0) (* (vy v0) f))
  (setf (vz v0) (* (vz v0) f))
  v0)

(defun nv4* (v0 f)
  (setf (vx v0) (* (vx v0) f))
  (setf (vy v0) (* (vy v0) f))
  (setf (vz v0) (* (vz v0) f))
  (setf (vw v0) (* (vw v0) f))
  v0)

(declaim (inline sq))
(defun sq (val) (* val val))

(defun len-v2^2 (v) (+ (sq (vx v)) (sq (vy v))))
(defun len-v2 (v) (sqrt (len-v2^2 v)))

(defun len-v3^2 (v) (+ (sq (vx v)) (sq (vy v)) (sq (vz v))))
(defun len-v3 (v) (sqrt (len-v3^2 v)))

(defun len-v4^2 (v) (+ (sq (vx v)) (sq (vy v)) (sq (vz v)) (sq (vw v))))
(defun len-v4 (v) (sqrt (len-v4^2 v)))

(defun nnorm-v2 (v) (nv2* v (/ 1.0 (len-v2 v))))
(defun nnorm-v3 (v) (nv3* v (/ 1.0 (len-v3 v))))
(defun nnorm-v4 (v) (nv4* v (/ 1.0 (len-v4 v))))
