;; fixing yas-snippet directory error
;; added 06-01-19
(defun spacemacs/python-remove-unused-imports()
  "Use Autoflake to remove unused function"
  "autoflake --remove-all-unused-imports -i unused_imports.py"
  (interactive)
  (if (executable-find "autoflake")
      (progn
        (shell-command (format "autoflake --remove-all-unused-imports -i %s"
                               (shell-quote-argument (buffer-file-name))))
        (revert-buffer t t t))
    (message "Error: Cannot find autoflake executable.")))

(setq yas-snippet-dirs
      '("~/.emacs.d/private/snippets"                 ;; personal snippets
        ;; "/path/to/some/collection/"           ;; foo-mode and bar-mode snippet collection
        ;; "/path/to/yasnippet/yasmate/snippets" ;; the yasmate collection
        ))

(add-hook 'python-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 4)
            (setq python-indent-offset 4)))

(provide 'my-python)
