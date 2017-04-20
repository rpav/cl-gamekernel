(in-package :gk)

(defvar *b2-body-objects* (make-hash-table))

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

 ;; Body accessors

(defun b2-body-position (body)
  (c-val ((body gk-b2-body))
    (unless (cffi:null-pointer-p (body :position))
      (body :position *))))

(defun (setf b2-body-position) (ptr body)
  "Set what this POINTS to, since setting the value means nothing"
  (c-val ((body gk-b2-body))
    (setf (body :position) ptr)))

(defun b2-body-angle (body)
  (c-val ((body gk-b2-body))
    (unless (cffi:null-pointer-p (body :angle))
      (body :angle *))))

(defun (setf b2-body-angle) (ptr body)
  "Set what this POINTS to, since setting the value means nothing"
  (c-val ((body gk-b2-body))
    (setf (body :angle) ptr)))

(defun b2-body-velocity (body)
  (c-val ((body gk-b2-body))
    (body :velocity)))

(defun b2-body-angular-velocity (body)
  (c-val ((body gk-b2-body))
    (body :angular-velocity)))

(defun b2-body-is-awake (body)
  (c-val ((body gk-b2-body))
    (body :is-awake)))

(defun b2-body-user-data (body)
  (c-val ((body gk-b2-body))
    (body :user-data)))

 ;; Body <-> Object associations

(defun make-b2-body (&optional object)
  "Make and optionally associate BODY with OBJECT"
  (let ((body (make-gk-b2-body)))
    (when object
      (add-b2-body-object body object))
    body))

(defun bodyhash (body)
  (cffi:pointer-address (ptr body)))

(defun add-b2-body-object (body object)
  (setf (gethash (bodyhash body) *b2-body-objects*) object))

(defun find-b2-body-object (body)
  (gethash (bodyhash body) *b2-body-objects*))

(defun remove-b2-body-object (body)
  (remhash (bodyhash body) *b2-body-objects*))

(defun clear-b2-body-objects ()
  (clrhash *b2-body-objects*))

 ;; fixture update

(defun b2-fixture-update-density (f)
  (c-val ((f gk-cmd-b2-fixture-update))
    (f :density)))

(defun (setf b2-fixture-update-density) (v f)
  (c-val ((f gk-cmd-b2-fixture-update))
    (setf (f :density) v)))

(defun b2-fixture-update-elasticity (f)
  (c-val ((f gk-cmd-b2-fixture-update))
    (f :elasticity)))

(defun (setf b2-fixture-update-elasticity) (v f)
  (c-val ((f gk-cmd-b2-fixture-update))
    (setf (f :elasticity) v)))

(defun b2-fixture-update-friction (f)
  (c-val ((f gk-cmd-b2-fixture-update))
    (f :friction)))

(defun (setf b2-fixture-update-friction) (v f)
  (c-val ((f gk-cmd-b2-fixture-update))
    (setf (f :friction) v)))

(defun b2-fixture-update-mask (f)
  (c-val ((f gk-cmd-b2-fixture-update))
    (f :update)))

(defun (setf b2-fixture-update-mask) (v f)
  (c-val ((f gk-cmd-b2-fixture-update))
    (setf (f :update) (autowrap:mask-apply 'gk.raw::gk-b2-fixture-update-mask v))))


 ;; Step

(defun map-b2-collisions (function step-cmd)
  (c-val ((step-cmd gk-cmd-b2-step))
    (loop for i from 0 below (step-cmd :ncollisions)
          do (c-let ((c gk-b2-contact-pair :ptr (step-cmd :collisions * i)))
               (let ((a (find-b2-body-object (c :a)))
                     (b (find-b2-body-object (c :b))))
                 (funcall function c a b))))))

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

 ;; Set Velocity

(defun b2-velocity-linear (f)
  (c-val ((f gk-cmd-b2-set-velocity))
    (f :linear)))

(defun (setf b2-velocity-linear) (v f)
  (c-val ((f gk-cmd-b2-set-velocity))
    (memcpy (f :linear) v)))

(defun b2-velocity-angular (f)
  (c-val ((f gk-cmd-b2-set-velocity))
    (f :angular)))

(defun (setf b2-velocity-angular) (v f)
  (c-val ((f gk-cmd-b2-set-velocity))
    (setf (f :angular) v)))
