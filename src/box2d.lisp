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
