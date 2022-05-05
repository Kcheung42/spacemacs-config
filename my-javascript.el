;; (with-eval-after-load 'web-mode
;;   (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
;;   (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
;;   (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil)))

;; (setq js2-strict-missing-semi-warning nil)

;; (eval-after-load 'web-mode
;;   '(progn
;;      (add-hook 'web-mode-hook #'add-node-modules-path)))

;; nodejs-repl
(spacemacs/set-leader-keys-for-major-mode 'js2-mode "ne" 'nodejs-repl-send-last-expression)
(spacemacs/set-leader-keys-for-major-mode 'js2-mode "nj" 'nodejs-repl-send-line)
(spacemacs/set-leader-keys-for-major-mode 'js2-mode "nr" 'nodejs-repl-send-region)
(spacemacs/set-leader-keys-for-major-mode 'js2-mode "nl" 'nodejs-repl-load-file)
(spacemacs/set-leader-keys-for-major-mode 'js2-mode "n'" 'nodejs-repl-switch-to-repl)
(spacemacs/set-leader-keys-for-major-mode 'js2-mode "ns" 'nodejs-repl-switch-to-repl)

;; React
(add-to-list 'auto-mode-alist '("\\.js\\'"    . rjsx-mode))

;; use eslint from node modules dicetory
(add-hook 'prog-mode-hook 'flycheck-mode)
(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))
(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

;; Tide setup
;; (defun setup-tide-mode ()
;;   (interactive)
;;   (tide-setup)
;;   (flycheck-mode +1)
;;   ;;  (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;   (eldoc-mode +1)
;;   (tide-hl-identifier-mode +1)
;;   (company-mode +1))
;; ;; aligns annotation to the right hand side
;; (setq company-tooltip-align-annotations t)
;; (setq tide-completion-ignore-case t)
;; ;; formats the buffer before saving
;; ;;(add-hook 'before-save-hook 'tide-format-before-save)
;; (add-hook 'js2-mode-hook #'setup-tide-mode)
;; (add-hook 'rjsx-mode-hook #'setup-tide-mode)
;; (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)
;; (setq tide-format-options
;;       '(:indentSize 2 :tabSize 2))

(provide 'my-javascript)
