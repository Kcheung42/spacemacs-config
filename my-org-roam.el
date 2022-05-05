;;; package --- Summary
;;; Commentary:
;; COMMON KEYBINDING
;; SPC a r f || find/create notes
;; SPC a r l || toggle org-roam
;; , r i || insert note (Highlight text first to create a link using the highlighted text)
;; SPC w / || Open vertical window
;; SPC w d ||
;; SPC 1 || move to first window (SPC 2 move to second window...)
;; press f then d quickly to exit insert mode
;; SPC f s || save buffer

;; FOR packages.el
;;; Code:
(defconst org-roam-packages
  '(org-roam))

;; (use-package org-roam-server
;;   :ensure t
;;   :config
;;   (setq org-roam-server-host "127.0.0.1"
;;         org-roam-server-port 4242
;;         org-roam-server-authenticate nil
;;         org-roam-server-export-inline-images t
;;         org-roam-server-serve-files nil
;;         org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
;;         org-roam-server-network-poll t
;;         org-roam-server-network-arrows nil
;;         org-roam-server-network-label-truncate t
;;         org-roam-server-network-label-truncate-length 60
;;         org-roam-server-network-label-wrap-length 20))

(setq org-roam-v2-ack t)

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/org/org-roam"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))

;; (use-package org-roam
;;   :ensure t
;;   :hook
;;   (after-init . org-roam-mode)
;;   :custom
;;   (org-roam-directory "~/org/org-roam")
;;   :init
;;   (progn
;;     (spacemacs/declare-prefix "ar" "org-roam")
;;     (spacemacs/set-leader-keys
;;       "arl" 'org-roam
;;       "art" 'org-roam-dailies-today
;;       "arm" 'org-roam-dailies-tomorrow
;;       "ary" 'org-roam-dailies-yesterday
;;       "arf" 'org-roam-node-find
;;       "arg" 'org-roam-graph)

;;     (spacemacs/declare-prefix-for-mode 'org-mode "mr" "org-roam")
;;     (spacemacs/set-leader-keys-for-major-mode 'org-mode
;;       "rl" 'org-roam
;;       "rb" 'org-roam-switch-to-buffer
;;       "rf" 'org-roam-node-find
;;       "ry" 'org-roam-dailies-yesterday
;;       "rm" 'org-roam-dailies-tomorrow
;;       "rt" 'org-roam-dailies-today
;;       "ri" 'org-roam-node-insert
      ;; "rg" 'org-roam-graph)))

(provide 'my-org-roam)
