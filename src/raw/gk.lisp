(in-package :gk.raw)

 ;; Basic structures

(defun cmd-type (cmd)
  (c-val ((cmd gk-cmd))
    (cmd :type)))

(defun (setf cmd-type) (v cmd)
  (c-val ((cmd gk-cmd))
    (setf (cmd :type) v)))

(defun free-gk-bundle (ptr)
  (c-let ((bundle gk-bundle :ptr ptr))
    (unless (cffi:null-pointer-p (bundle :lists))
      (free (bundle :lists)))
    (free ptr)))

(defmethod destroy-object ((bundle gk-bundle))
  (autocollect-cancel bundle)
  (free-gk-bundle (invalidate bundle)))

(defun make-gk-bundle (start &key (sort :none) (prealloc 1))
  (c-let ((bundle gk-bundle :calloc t))
    (autocollect (ptr) bundle (free-gk-bundle ptr))
    (setf (cmd-type (bundle :start)) :pass)
    (setf (bundle :start :sort) sort)
    (setf (bundle :start :list-index) start)
    (setf (bundle :nlists) prealloc)
    ;; Note bundle.lists is a gk_list**, not a gk_list*
    (setf (bundle :lists)
          (alloc ':pointer prealloc))
    bundle))

(defun set-bundle-list (bundle index list)
  (c-val ((b gk-bundle bundle)
          (l gk-list list))
    (setf (b :lists * index) (l &))))

(defun init-gk-list (list subsystem &optional (prealloc 1))
  (c-val ((l gk-list list))
    (setf (l :sub) subsystem)
    (if (and prealloc (> prealloc 0))
        (progn
          (setf (l :ncmds) prealloc)
          (setf (l :cmds) (alloc :pointer prealloc)))
        (progn
          (setf (l :ncmds) 0)
          (setf (l :cmds) (cffi-sys:null-pointer))))))

(defun free-gk-list (ptr)
  (c-let ((l gk-list :ptr ptr))
    (unless (cffi:null-pointer-p (l :cmds)) (free (l :cmds)))
    (free ptr)))

(defmethod destroy-object ((l gk-list))
  (autocollect-cancel l)
  (free-gk-list (invalidate l)))

(defun make-gk-list (subsystem &optional (prealloc 1))
  (c-let ((l gk-list :calloc t))
    (autocollect (ptr) l (free-gk-list ptr))
    (init-gk-list l subsystem prealloc)
    l))

(defun set-list-cmd (list index cmd)
  (c-val ((l gk-list list)
          (cmd gk-cmd))
    (setf (l :cmds * index) (cmd &))))

(defun init-gk-cmd (cmd type &optional (key 0))
  (c-val ((cmd gk-cmd))
    (setf (cmd :type) type)
    (setf (cmd :key) (or key 0))))

(defun free-gk-pass (ptr)
  (free ptr))

(defmethod destroy-object ((pass gk-pass))
  (autocollect-cancel pass)
  (free-gk-pass (invalidate pass)))

(defun make-gk-pass (list-index &optional (sort :none))
  (c-let ((pass gk-pass))
    (autocollect (ptr) pass
      (free-gk-pass ptr))
    (setf (cmd-type pass) :pass)
    (setf (pass :sort) sort)
    (setf (pass :list-index) list-index)
    pass))

 ;; Utility

(defmacro simply-destroy (&rest types)
  `(progn
     ,@(loop for type in types
             collect `(defmethod destroy-object ((o ,type))
                        (autocollect-cancel o)
                        (free (invalidate o))))))
