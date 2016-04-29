(in-package :gk)

(defclass cmd-list ()
  ((gk-list)
   (list-count)
   (list-fill :initform 0)
   (refs :initform nil)))

(defmethod initialize-instance ((l cmd-list)
                                &key subsystem (prealloc 1)
                                list-ptr
                                &allow-other-keys)
  (call-next-method)
  (with-slots (gk-list list-count list-fill) l
    (setf gk-list (or list-ptr
                      (make-gk-list subsystem prealloc)))
    (if list-ptr
        (setf list-count (c-ref list-ptr gk-list :ncmds))
        (setf list-count prealloc))
    (setf (c-ref gk-list gk-list :ncmds) list-fill)))

(defun ensure-cmd-list (list size)
  (with-slots (gk-list list-count) list
    (unless (< size list-count)
      (c-let ((l gk-list :from gk-list))
        (setf list-count (max size (* 2 list-count)))
        (let ((new (autowrap:realloc (ptr (l :cmds)) :pointer list-count)))
          (setf (l :cmds) new))))))

(defun cmd-list-append (list &rest cmds)
  (let ((len (length cmds)))
    (with-slots (gk-list list-count list-fill refs) list
      (ensure-cmd-list list (+ list-fill len))
      (loop for cmd in cmds
            for i from list-fill
            do (setf (c-ref gk-list gk-list :cmds * i)
                     (ptr cmd))
               (push cmd refs))
      (incf list-fill len)
      (setf (c-ref gk-list gk-list :ncmds) list-fill)
      ;; Track refs
      (values))))

(defun cmd-list-clear (list)
  (with-slots (gk-list list-fill refs) list
    (setf refs nil)
    (setf list-fill 0)
    (setf (c-ref gk-list gk-list :ncmds) 0)))

(defclass cmd-list-nvg (cmd-list) ())

(defmethod initialize-instance ((l cmd-list-nvg)
                                &key width height (ratio (float (/ width height)))
                                (prealloc 1)
                                &allow-other-keys)
  (let ((nvg-list (make-gk-list-nvg width height
                                    :prealloc prealloc
                                    :ratio ratio)))
    (call-next-method l :list-ptr nvg-list)))
