;; Load org-mode
(require 'org-install)
(require 'org-agenda)

;; Turn on org-mode w/ font-lock for .org and .txt files
(add-to-list 'auto-mode-alist '("\\.\\(org\\|txt\\)$" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock)

;; Setup some custom keybindings
;; (global-set-key "\C-cl" 'org-store-link)
;; (global-set-key "\C-cL" 'org-insert-link-global)
;; (global-set-key "\C-cr" 'org-capture)
;; (global-set-key "\C-cO" 'org-open-at-point-global)
;; (global-set-key "\C-ca" 'org-agenda)
;; (global-set-key "\C-cb" 'org-iswitchb)

;; Customize variables
(setq
      ;; org-adapt-indentation t ;; always indent content
      org-agenda-files '("~/org/todo/agenda.org")
      org-agenda-scheduled-leaders '("" "")
      org-agenda-show-all-dates t
      org-agenda-skip-deadline-if-done t
      org-agenda-skip-scheduled-if-done t
      org-agenda-span 'day
      org-agenda-start-on-weekday 0 ;; always start the week view on Sunday
      org-agenda-use-time-grid nil
      org-deadline-warning-days 14
      org-default-notes-file "~/org/todo/agenda.org"
      org-directory "~/org/todo/"
      org-enforce-todo-checkbox-dependencies nil
      org-fast-tag-selection-single-key nil ;; 'expert is another option (see help)
      org-hide-emphasis-markers t
      org-hide-leading-stars t
      org-reverse-note-order nil
      org-special-ctrl-a/e t
      org-startup-folded 'content
      org-startup-indented nil ;;Ensure that org files are opened in outline view
      ;; org-startup-with-latex-preview t
      org-log-repeat nil)

;; When =org-journal-file-pattern= has the default value, this would be the
;; regex.
(setq org-agenda-file-regexp
      "\\`\\\([^.].*\\.org\\\|[0-9]\\\{8\\\}\\\(\\.gpg\\\)?\\\)\\'")
;; (add-to-list 'org-agenda-files org-journal-dir)

(add-to-list 'org-agenda-custom-commands '("N" "Agenda and Prioritized TODOs"
                                           ((agenda #1="")
                                            (search "[#A]")
                                            (search "[#B]")
                                            (search "[#C]"))))


;; Setup org-capture templates
(setq org-capture-templates
      '(
        ("E" "Emacs"       entry (file+headline "~/org/tech-journal.org" "Emacs/Spacemacs") "* %?")
        ("G" "GridFire-UI" entry (file+headline "~/org/todo/agenda.org" "GridFire-UI") "* TODO GridFire-UI: %?")
        ("M" "Misc"        entry (file+headline "~/org/todo/agenda.org" "Misc"       ) "* TODO Misc: %?")
        ("P" "Peer Review" entry (file+headline "~/org/todo/agenda.org" "Peer Reviews" ) "* TODO PR: %?")
        ("S" "Sysadmin"    entry (file+headline "~/org/todo/agenda.org" "Sysadmin"   ) "* TODO Sysadmin: %?")
        ("a" "AWE"         entry (file+headline "~/org/todo/agenda.org" "AWE"        ) "* TODO AWE: %?")
        ("b" "Behave"      entry (file+headline "~/org/todo/agenda.org" "Behave"     ) "* TODO Behave: %?")
        ("d" "DevDocs"     entry (file+headline "~/org/todo/agenda.org" "DevDocs"    ) "* TODO DevDocs: %?")
        ("e" "Events"      entry (file+headline "~/org/todo/agenda.org" "Events"     ) "* TODO Events: %?")
        ("g" "GridFire"    entry (file+headline "~/org/todo/agenda.org" "GridFire"   ) "* TODO GridFire: %?")
        ("j" "Journal entry" plain (function org-journal-find-location) "** %(format-time-string org-journal-time-format)%^{Title}\n%i%?" :jump-to-captured t :immediate-finish t)
        ("m" "Comm/Plan"   entry (file+headline "~/org/todo/agenda.org" "Comm/Plan"  ) "* TODO Comm/Plan: %?")
        ("p" "Pyregence"   entry (file+headline "~/org/todo/agenda.org" "Pyregence"  ) "* TODO Pyregence: %?")
        ("s" "SIG"         entry (file+headline "~/org/todo/agenda.org" "SIG"        ) "* TODO SIG: %?")
        ("y" "GeoSync"     entry (file+headline "~/org/todo/agenda.org" "GeoSync"    ) "* TODO Geosync: %?")
        ))

;; ("j" "Clojure"     entry (file+headline "~/org/todo/agenda.org" "Clojure"    ) "* TODO %?")


;; Define default TODO keywords and their faces
(setq org-todo-keywords '((sequence  "TODO" "STARTED" "REVIEW" "APPROVED" "DONE" "CANCELED"))
      org-todo-keyword-faces '(("TODO"     :foreground "red"          :weight bold)
                               ("STARTED"  :foreground "orange"       :weight bold)
                               ("REVIEW"   :foreground "orange"       :weight bold)
                               ("APPROVED" :foreground "forest green" :weight bold)
                               ("DONE"     :foreground "forest green" :weight bold)
                               ("CANCELED" :foreground "black"        :weight bold)))

;; Add org-babel support
(when (locate-file "ob" load-path load-suffixes)
  (require 'ob)
  (require 'ob-tangle)
  (require 'ob-shell)
  (require 'ob-sql)
  (require 'ob-dot)
  (require 'ob-gnuplot)
  (require 'ob-clojure)
  (require 'ob-python)
  (add-to-list 'org-structure-template-alist '("S" "#+name: ?\n#+begin_src \n\n#+end_src" "<src id=\"?\" lang=\"\">\n\n</src>"))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (clojure    . t)
     (dot        . t)
     (emacs-lisp . t)
     (gnuplot    . t)
     (mermaid    . t)
     (python     . t)
     (shell      . t)
     (scheme     . t)
     (sql        . t)
     (C          . t)))

  (setq org-src-window-setup         'current-window
        org-src-fontify-natively     t
        org-confirm-babel-evaluate   nil
        org-src-fontify-natively     t
        org-src-preserve-indentation t
        org-babel-C++-compiler       "/home/linuxbrew/.linuxbrew/bin/clang++ -std=c++20"))

;; Pull in the htmlize library for pretty source code in HTML output
(require 'htmlize)

;; Add additional (output) formats to the org-mode exporter
(require 'ox-ascii)
(require 'ox-beamer)
(require 'ox-html)
(require 'ox-icalendar)
(require 'ox-latex)
(require 'ox-man)
;; (require 'ox-gfm) ;; use 'ox-md for standard markdown (conflicts with ox-man)
(require 'ox-odt)
(require 'ox-publish)
(require 'ox-texinfo)

;; Fontify source code in org-latex export to PDF
(setq org-latex-default-packages-alist '(("AUTO"     "inputenc"  t)
                                         (""         "graphicx"  t)
                                         (""         "longtable" nil)
                                         (""         "float"     nil)
                                         (""         "wrapfig"   nil)
                                         (""         "rotating"  nil)
                                         ("normalem" "ulem"      t)
                                         (""         "amsmath"   t)
                                         (""         "textcomp"  t)
                                         (""         "marvosym"  t)
                                         (""         "wasysym"   t)
                                         (""         "amssymb"   t)
                                         (""         "minted"    nil)
                                         (""         "hyperref"  nil)
                                         "\\tolerance=1000"))
(setq org-latex-listings 'minted)
(setq org-latex-minted-options '(("linenos"         "false")
                                 ("frame"           "single")
                                 ("fontsize"        "\\scriptsize")
                                 ("baselinestretch" "1.0")))
(setq org-latex-pdf-process '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                              "bibtex %b"
                              "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                              "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; Redefine the header level meanings in LaTeX export by documentclass
(setq org-latex-classes '(("article" "\\documentclass[11pt]{article}"
                           ("\\section{%s}"       . "\\section*{%s}")
                           ("\\subsection{%s}"    . "\\subsection*{%s}")
                           ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                           ("\\paragraph{%s}"     . "\\paragraph*{%s}")
                           ("\\subparagraph{%s}"  . "\\subparagraph*{%s}"))
                          ("report" "\\documentclass[11pt]{report}"
                           ("\\chapter{%s}"       . "\\chapter*{%s}")
                           ("\\section{%s}"       . "\\section*{%s}")
                           ("\\subsection{%s}"    . "\\subsection*{%s}")
                           ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                           ("\\paragraph{%s}"     . "\\paragraph*{%s}"))
                          ("book" "\\documentclass[11pt]{book}"
                           ("\\part{%s}"          . "\\part*{%s}")
                           ("\\chapter{%s}"       . "\\chapter*{%s}")
                           ("\\section{%s}"       . "\\section*{%s}")
                           ("\\subsection{%s}"    . "\\subsection*{%s}")
                           ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
                          ("beamer"
                           "\\documentclass\[presentation\]\{beamer\}"
                           ("\\section\{%s\}" . "\\section*\{%s\}")
                           ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
                           ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}"))))

;; Turn off inclusion of the hypersetup{} section in LaTeX export
(setq org-latex-with-hyperref nil)

;; Make [[Name of Section]] refs work properly in LaTeX export (no need for \label tags on section headers)
(setq org-export-latex-hyperref-format "\\ref{%s}")


;;============================================================================
;; Allow automatically handing of created/expired meta data. (START)
;;============================================================================
(require 'org-expiry)
;; Configure it a bit to my liking
(setq
 org-expiry-created-property-name "CREATED" ; Name of property when an item is created
 org-expiry-inactive-timestamps   t         ; Don't have everything in the agenda view
 )

(defun mrb/insert-created-timestamp()
  "Insert a CREATED property using org-expiry.el for TODO entries"
  (org-expiry-insert-created)
  (org-back-to-heading)
  (org-end-of-line)
  (insert " ")
  )

;; Whenever a TODO entry is created, I want a timestamp
;; Advice org-insert-todo-heading to insert a created timestamp using org-expiry
(defadvice org-insert-todo-heading (after mrb/created-timestamp-advice activate)
  "Insert a CREATED property using org-expiry.el for TODO entries"
  (mrb/insert-created-timestamp)
  )
;; Make it active
(ad-activate 'org-insert-todo-heading)
;;============================================================================
;; Allow automatically handing of created/expired meta data. (END)
;;============================================================================


(defvar org-latex-fragment-last nil
  "Holds last fragment/environment you were on.")

(defun org-latex-fragment-toggle ()
  "Toggle a latex fragment image "
  (and (eq 'org-mode major-mode)
       (let* ((el (org-element-context))
              (el-type (car el)))
         (cond
          ;; were on a fragment and now on a new fragment
          ((and
            ;; fragment we were on
            org-latex-fragment-last
            ;; and are on a fragment now
            (or
             (eq 'latex-fragment el-type)
             (eq 'latex-environment el-type))
            ;; but not on the last one this is a little tricky. as you edit the
            ;; fragment, it is not equal to the last one. We use the begin
            ;; property which is less likely to change for the comparison.
            (not (= (org-element-property :begin el)
                    (org-element-property :begin org-latex-fragment-last))))
           ;; go back to last one and put image back
           (save-excursion
             (goto-char (org-element-property :begin org-latex-fragment-last))
             (org-preview-latex-fragment))
           ;; now remove current image
           (goto-char (org-element-property :begin el))
           (let ((ov (loop for ov in org-latex-fragment-image-overlays
                           if
                           (and
                            (<= (overlay-start ov) (point))
                            (>= (overlay-end ov) (point)))
                           return ov)))
             (when ov
               (delete-overlay ov)))
           ;; and save new fragment
           (setq org-latex-fragment-last el))

          ;; were on a fragment and now are not on a fragment
          ((and
            ;; not on a fragment now
            (not (or
                  (eq 'latex-fragment el-type)
                  (eq 'latex-environment el-type)))
            ;; but we were on one
            org-latex-fragment-last)
           ;; put image back on
           (save-excursion
             (goto-char (org-element-property :begin org-latex-fragment-last))
             (org-preview-latex-fragment))
           ;; unset last fragment
           (setq org-latex-fragment-last nil))

          ;; were not on a fragment, and now are
          ((and
            ;; we were not one one
            (not org-latex-fragment-last)
            ;; but now we are
            (or
             (eq 'latex-fragment el-type)
             (eq 'latex-environment el-type)))
           (goto-char (org-element-property :begin el))
           ;; remove image
           (let ((ov (loop for ov in org-latex-fragment-image-overlays
                           if
                           (and
                            (<= (overlay-start ov) (point))
                            (>= (overlay-end ov) (point)))
                           return ov)))
             (when ov
               (delete-overlay ov)))
           (setq org-latex-fragment-last el))))))


(add-hook 'post-command-hook 'org-latex-fragment-toggle)

;; Set scale
(setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))

;; Set bold foreground
(add-to-list 'org-emphasis-alist
             '("*" (bold :background "green" :foreground "black")))

;; Set org links to open current window
(setq org-link-frame-setup '((file . find-file)))

(provide 'packages)

;; Add strike through when checkboxes are checked
(defface org-checkbox-done-text
  '((t (:foreground "#71696A" :strike-through t)))
  "Face for the text part of a checked org-mode checkbox.")

;; Add strike through when checkboxes are checked
(font-lock-add-keywords
 'org-mode
 `(("^[ \t]*\\(?:[-+*]\\|[0-9]+[).]\\)[ \t]+\\(\\(?:\\[@\\(?:start:\\)?[0-9]+\\][ \t]*\\)?\\[\\(?:X\\|\\([0-9]+\\)/\\2\\)\\][^\n]*\n\\)"
    1 'org-checkbox-done-text prepend))
 'append)


;; mermaid flow chart setup
(setq ob-mermaid-cli-path "/home/kcheung/mermaid.cli/node_modules/.bin/")

(setq org-list-allow-alphabetical t)

(setq org-edit-src-auto-save-idle-delay 1)

(setq org-edit-src-auto-save-idle-delay t)

(provide 'my-org)
