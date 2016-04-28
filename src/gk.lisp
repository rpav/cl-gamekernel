(in-package :gk)

(defun create (impl) (gk.raw:gk-create impl))

(defun process (gk bundle)
  (gk-process gk (slot-value bundle 'gk-bundle)))
