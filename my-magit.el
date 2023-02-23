;;; package  --- Summary

;;; Commentary:

;;; Code:

(require 'magit)
(require 'forge)

;; Interact with Github and Gitlab
(setq forge-topic-list-limit '(200 . -5))

;; show only two buffers when ediffing
(setq magit-ediff-dwim-show-on-hunks t)

;; exlude some files to search
(setq magit-todos-exclude-globs '("*.map"))

;; Thanks Gary Johnson
;; Custom function to simplify code reviews
;; To use this function, simply open the *magit-status* buffer,
;; place your cursor on a PR line and type M-x pull-request-review.
;; A new buffer should open with your comments file for this repo.
;; If this is the first time you have reviewed this PR, a new
;; section will be added to the Org file for this PR. If you have
;; reviewed it before, your cursor should automatically appear on
;; the outline heading containing your last comments for this PR.
;; Note that this function expects that you store your pull request
;; review files under "~/sig/pull-requests" in a text file named
;; $REPO.org. For example, if I'm reviewing the gridfire repo, then
;; my comments file is at "~/sig/pull-requests/gridfire.org". If you
;; use a different folder structure on your computer, make sure to
;; update the file binding in the Elisp code above.
(defun pull-request-review ()
  (interactive)
  (let* ((line (buffer-substring-no-properties (line-beginning-position)
                                               (line-end-position)))
         (words (split-string line))
         (pr-id (string-trim-left (first words) "#"))
         (pr-text (string-join (rest words) " "))
         (entry (concat "* TODO PR" pr-id " (" pr-text ")"))
         (repo (string-remove-prefix "magit: " (buffer-name)))
         (file (concat "~/sig/pull-requests/" repo ".org")))
    (find-file file)
    (goto-char (point-min))
    (if (search-forward entry nil :end)
        (forward-char)
      (insert entry "\n"))))

(provide 'my-magit)
;;; my-magit.el ends here
