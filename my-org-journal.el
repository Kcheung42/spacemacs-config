;;; package  --- Summary

;;; Commentary:

;;; Code:

(require 'org)

(setq org-journal-carryover-items "TODO=\"TODO\"|TODO=\"STARTED\"")

;; ;; You can configure a capture template in order to integrate org-journal with
;; ;; org-capture, as in the following example for a daily journal:
(defun org-journal-find-location ()
  ;; Open today's journal, but specify a non-nil prefix argument in order to
  ;; inhibit inserting the heading; org-capture will insert the heading.
  (org-journal-new-entry t)
  (org-narrow-to-subtree)
  (goto-char (point-max)))


(defun org-journal-file-header-func (time)
  "Custom function to create journal header."
  (concat
   (pcase org-journal-file-type
     (`daily "#+TITLE: Daily Journal\n#+STARTUP: showeverything")
     (`weekly "#+TITLE: Weekly Journal\n#+STARTUP: folded")
     (`monthly "#+TITLE: Monthly Journal\n#+STARTUP: folded")
     (`yearly "#+TITLE: Yearly Journal\n#+STARTUP: folded"))))

;; (setq org-capture-templates '(("j" "Journal entry" entry (function
;;                                                           org-journal-find-location)
;;                                                               "*
;;                                                           %(format-time-string
;;                                                           org-journal-time-format)%^{Title}\n%i%?")))

(setq org-journal-file-header 'org-journal-file-header-func)

(provide 'my-org-journal)
;;; my-clojure.el ends here
