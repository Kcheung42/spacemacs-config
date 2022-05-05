;; (setq
;;  ;; Specify the workspace to use by default
;;  eclimd-default-workspace "/home/kcheung/Java/"
;;  ;; whether autostarting eclimd or not (default nil)
;;  eclimd-autostart t
;;  ;; Whether or not to block emacs until eclimd is ready (default nil)
;; eclimd-wait-for-process t)

;; regular auto-complete initialization
(require 'auto-complete-config)
(ac-config-default)

;; add the emacs-eclim source
;; (require 'ac-emacs-eclim-source)
;; (ac-emacs-eclim-config)

(provide 'my-java)
;;; my-java.el ends here
