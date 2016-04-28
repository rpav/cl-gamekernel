(in-package :gk.raw)

 ;; DESTROY protocol

(defgeneric destroy-object (thing)
  (:documentation "Destroy `THING`, calling any appropriate functions,
freeing all data, and invalidating the wrapper."))

(defun destroy (&rest things)
  (map nil #'destroy-object things))

(defmethod destroy-object ((gk gk-context))
  (gk.ffi:gk-destroy gk))
