;;; package  --- Summary

;;; Commentary:

;;; Code:

(require 'clojure-mode)

;; (global-aggressive-indent-mode 1)

;; (add-hook 'clojure-mode-hook #'aggressive-indent-mode)

(setq clojure-align-forms-automatically      t
      dotspacemacs-smart-closing-parenthesis t
      clojure-enable-clj-refactor            t)

;; fix clojure stack traces
(setq cider-clojure-cli-global-options "-J-XX:-OmitStackTraceInFastThrow")

;; set indent style to
;; (some-function
;;   10
;;   1
;;   2)
;; (some-function 10
;;                1
;;                2)
;; (setq clojure-indent-style 'align-arguments)

;; (some-function
;;  10
;;  1
;;  2)
;; (some-function 10
;;                1
;;                2)
(setq clojure-indent-style 'always-align) ;Default

(provide 'my-clojure)
;;; my-clojure.el ends here
