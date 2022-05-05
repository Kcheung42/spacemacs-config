(require 'tramp)

(setq remote-file-name-inhibit-cache nil)

(setq vc-ignore-dir-regexp (format "%s\\|%s"
                                   vc-ignore-dir-regexp
                                   tramp-file-name-regexp))
(setq tramp-verbose 1)

(setq tramp-copy-size-limit 100000)

;; tramp was really slow. This should fix it
(setq projectile-mode-line "Projectile")

(provide 'my-tramp)
