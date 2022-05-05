;; Determine the specific system type.
;; Emacs variable system-type doesn't yet have a "wsl/linux" value,
;; so I'm front-ending system-type with my variable: sysTypeSpecific.
;; I'm no elisp hacker, so I'm diverging from the elisp naming convention
;; to ensure that I'm not stepping on any pre-existing variable.
(setq-default sysTypeSpecific  system-type) ;; get the system-type value

(cond
 ((eq sysTypeSpecific 'gnu/linux)
  (when (string-match "Linux.*Microsoft.*Linux"
                      (shell-command-to-string "uname -a"))

    (setq-default sysTypeSpecific "wsl/linux") ;; for later use.
    (setq
     cmdExeBin"/mnt/c/Windows/System32/cmd.exe"
     cmdExeArgs '("/c" "start" "") )
    (setq
     browse-url-generic-program  cmdExeBin
     browse-url-generic-args     cmdExeArgs
     browse-url-browser-function 'browse-url-generic)
    )))

(defun wsl-copy (start end)
  (interactive "r")
  (shell-command-on-region start end "clip.exe")
  (deactivate-mark))

(global-set-key
 (kbd "C-c C-y")
 'wsl-copy)

(defun wsl-paste ()
  "Paste contents of Windows clipboard to buffer"
  (interactive)
  (let ((coding-system-for-read 'dos)
        (default-directory "/mnt/c/"))
    (insert (shell-command-to-string
             "powershell.exe -command 'Get-Clipboard'"))))

(global-set-key
 (kbd "C-c C-v")
 'wsl-paste)

(provide 'my-wsl)
