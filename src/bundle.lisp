(in-package :gk)

(defclass bundle ()
  ((gk-bundle)
   (list-count)
   (list-fill :initform 0)
   (refs :initform nil)))

(defmethod initialize-instance ((b bundle)
                                &key (start 0) (prealloc 1) (sort :none)
                                &allow-other-keys)
  (call-next-method)
  (with-slots (gk-bundle list-count) b
    (setf gk-bundle (make-gk-bundle start :sort sort :prealloc prealloc)
          list-count prealloc)
    (c-let ((bundle gk-bundle :from gk-bundle))
      (setf (bundle :nlists) 0))))

(defun bundle-start (b)
  (with-slots (gk-bundle) b
    (c-ref gk-bundle gk-bundle :start :list-index)))

(defun (setf bundle-start) (v b)
  (with-slots (gk-bundle) b
    (setf (c-ref gk-bundle gk-bundle :start :list-index) v)))

(defun bundle-sort (b)
  (with-slots (gk-bundle) b
    (c-ref gk-bundle gk-bundle :start :sort)))

(defun (setf bundle-sort) (v b)
  (with-slots (gk-bundle) b
    (setf (c-ref gk-bundle gk-bundle :start :sort) v)))

(defun ensure-bundle-list (bundle size)
  (with-slots (gk-bundle list-count) bundle
    (unless (< size list-count)
      (c-let ((b gk-bundle :from gk-bundle))
        (incf list-count (max size 4))
        (let ((new (autowrap:realloc (b :lists) :pointer list-count)))
          (setf (b :lists) new))))))

(defun bundle-append (bundle list)
  (with-slots (gk-bundle list-count list-fill refs) bundle
    (with-slots (gk-list) list
      (ensure-bundle-list bundle (1+ list-fill))
      (setf (c-ref gk-bundle gk-bundle :lists * list-fill) (ptr gk-list))
      (incf list-fill)
      (setf (c-ref gk-bundle gk-bundle :nlists) list-fill)
      (push list refs)
      (values))))

(defun bundle-clear (bundle)
  (with-slots (gk-bundle list-fill refs) bundle
    (setf refs nil)
    (setf list-fill 0)
    (setf (c-ref gk-bundle gk-bundle :nlists) 0)))
