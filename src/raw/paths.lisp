(in-package :gk.raw)

(defun make-path (definition)
  (c-let ((vec :float :count (length definition) :calloc t))
    (handler-case
        (progn
          (loop for v in definition
                for i from 0
                do (typecase v
                     (symbol
                      (let ((cmd (enum-value 'gk-pathdef-cmds v)))
                        (if cmd
                            (setf (vec i) (float cmd))
                            (error "~A is not a valid command." v))))
                     (number (setf (vec i) (float v)))))
          (vec &))
      (error (e)
        (free (vec &))
        (error e)))))

(defun free-gk-cmd-path (ptr)
  (c-let ((cmd gk-cmd-path :ptr ptr))
    (free (cmd :pathdef))
    (free ptr)))

(defmethod destroy-object ((cmd gk-cmd-path))
  (autocollect-cancel cmd)
  (free-gk-cmd-path (invalidate cmd)))

(defun make-gk-cmd-path (ptr len &key key)
  (c-let ((cmd gk-cmd-path :calloc t))
    (init-gk-cmd cmd :path key)
    (setf (cmd :pathdef) ptr)
    (setf (cmd :pathlen) len)
    (autocollect (ptr) cmd
      (free-gk-cmd-path ptr))))

