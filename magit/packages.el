(require 'magit)
(require 'forge)
(require 'magit-todos)

;; show list of TODOS in magit-status-buffers
(magit-todos-mode)

;; Interact with Github and Gitlab
(setq forge-topic-list-limit '(200 . -5))
