(require 'use-package)
(require 'org)

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "/home/kcheung/org/org-roam"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  (setq org-roam-v2-ack t)
  (org-roam-setup)
  (require 'org-roam-protocol))

(use-package helm :ensure t :config (helm-mode))

(provide 'my-org-roam)
