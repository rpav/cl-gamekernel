(in-package :gk)

(defun cmd-b2-body-create (world &rest body-defs)
  (c-val ((cmd gk-cmd-b2-body-create
               (make-gk-cmd-b2-body-create world :prealloc (length body-defs))))
    (loop for b in body-defs
          for i from 0
          do (setf (cmd :defs * i) b))
    cmd))

(defun cmd-b2-fixture-create (body list &key (key 0))
  (let ((vec (make-path list)))
    (make-gk-cmd-b2-fixture-create body vec (length list) :key key)))


(defclass cmd-list-b2 (cmd-list) ())

(defmethod initialize-instance ((l cmd-list-b2) &key (prealloc 1) &allow-other-keys)
  (call-next-method l :subsystem :box2d :prealloc prealloc))

 ;; Force

(defun b2-force (f)
  (c-val ((f gk-cmd-b2-force))
    (f :force)))

(defun (setf b2-force) (v f)
  (c-val ((f gk-cmd-b2-force))
    (memcpy (f :force) v)))

(defun b2-force-point (f)
  (c-val ((f gk-cmd-b2-force))
    (f :point)))

(defun (setf b2-force-point) (v f)
  (c-val ((f gk-cmd-b2-force))
    (memcpy (f :point) v)))

 ;; Torque

(defun b2-torque (f)
  (c-val ((f gk-cmd-b2-torque))
    (f :torque)))

(defun (setf b2-torque) (v f)
  (c-val ((f gk-cmd-b2-torque))
    (setf (f :torque) v)))

 ;; Linear Impulse

(defun b2-linear-impulse (f)
  (c-val ((f gk-cmd-b2-linear-impulse))
    (f :impulse)))

(defun (setf b2-linear-impulse) (v f)
  (c-val ((f gk-cmd-b2-linear-impulse))
    (memcpy (f :impulse) v)))

(defun b2-linear-impulse-point (f)
  (c-val ((f gk-cmd-b2-linear-impulse))
    (f :point)))

(defun (setf b2-linear-impulse-point) (v f)
  (c-val ((f gk-cmd-b2-linear-impulse))
    (memcpy (f :point) v)))

 ;; Angular Impulse

(defun b2-angular-impulse (f)
  (c-val ((f gk-cmd-b2-angular-impulse))
    (f :impulse)))

(defun (setf b2-angular-impulse) (v f)
  (c-val ((f gk-cmd-b2-angular-impulse))
    (setf (f :impulse) v)))
