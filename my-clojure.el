;;; package  --- Summary

;;; Commentary:

;;; Code:

(require 'clojure-mode)

;; (global-aggressive-indent-mode 1)

;; (add-hook 'clojure-mode-hook #'aggressive-indent-mode)

(setq clojure-align-forms-automatically      t
      dotspacemacs-smart-closing-parenthesis t
      clojure-enable-clj-refactor            t)

(provide 'my-clojure)
;;; my-clojure.el ends here
