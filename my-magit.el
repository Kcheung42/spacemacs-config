;;; package  --- Summary

;;; Commentary:

;;; Code:

(require 'magit)
(require 'forge)

;; Interact with Github and Gitlab
(setq forge-topic-list-limit '(200 . -5))

;; show only two buffers when ediffing

(setq magit-ediff-dwim-show-on-hunks t)

(provide 'my-magit)
;;; my-magit.el ends here
