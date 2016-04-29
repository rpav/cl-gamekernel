(in-package :gk)

(defun create (impl) (gk.raw:gk-create impl))

(defun process (gk bundle)
  (c-val ((bundle gk-bundle (slot-value bundle 'gk-bundle)))
    (gk-process gk bundle)
    (unless (zerop (bundle :error :code))
      (error "GameKernel: Error (~S): ~A"
             (bundle :error :code)
             (bundle :error :message)))))
