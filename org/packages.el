;; Load org-mode
(require 'org-install)
(require 'org-agenda)

;; Turn on org-mode w/ font-lock for .org and .txt files
(add-to-list 'auto-mode-alist '("\\.\\(org\\|txt\\)$" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock)

;; Ensure that org files are opened in outline view
(setq org-startup-folded 'content)

;; Setup some custom keybindings
;; (global-set-key "\C-cl" 'org-store-link)
;; (global-set-key "\C-cL" 'org-insert-link-global)
;; (global-set-key "\C-cr" 'org-capture)
;; (global-set-key "\C-cO" 'org-open-at-point-global)
;; (global-set-key "\C-ca" 'org-agenda)
;; (global-set-key "\C-cb" 'org-iswitchb)

;; Customize variables
(setq org-log-repeat nil
      org-special-ctrl-a/e t
      org-startup-indented nil
      org-hide-leading-stars t
      org-reverse-note-order nil
      org-deadline-warning-days 14
      org-fast-tag-selection-single-key nil ;; 'expert is another option (see help)
      org-directory "~/org/todo/"
      org-default-notes-file "~/org/todo/agenda.org"
      org-agenda-files '("~/org/todo/agenda.org")
      org-agenda-span 'day
      org-agenda-show-all-dates t
      org-agenda-skip-deadline-if-done t
      org-agenda-skip-scheduled-if-done t
      org-agenda-start-on-weekday 0 ;; always start the week view on Sunday
      org-agenda-use-time-grid nil
      org-agenda-scheduled-leaders '("" "")
      org-enforce-todo-checkbox-dependencies nil
      org-hide-emphasis-markers t)

;; When =org-journal-file-pattern= has the default value, this would be the
;; regex.
(setq org-agenda-file-regexp
      "\\`\\\([^.].*\\.org\\\|[0-9]\\\{8\\\}\\\(\\.gpg\\\)?\\\)\\'")
(add-to-list 'org-agenda-files org-journal-dir)

(add-to-list 'org-agenda-custom-commands '("N" "Agenda and Prioritized TODOs"
                                           ((agenda #1="")
                                            (search "[#A]")
                                            (search "[#B]")
                                            (search "[#C]"))))


;; Setup org-capture templates
(setq org-capture-templates
      '(("e" "Events"      entry (file+headline "~/org/todo/agenda.org" "Events"     ) "* TODO %?")
        ("m" "Comm/Plan"   entry (file+headline "~/org/todo/agenda.org" "Comm/Plan"  ) "* TODO %?")
        ("s" "SIG"         entry (file+headline "~/org/todo/agenda.org" "SIG"        ) "* TODO %?")
        ("p" "Pyregence"   entry (file+headline "~/org/todo/agenda.org" "Pyregence"  ) "* TODO %?")
        ("g" "GridFire"    entry (file+headline "~/org/todo/agenda.org" "GridFire"   ) "* TODO %?")
        ("G" "GridFire-UI" entry (file+headline "~/org/todo/agenda.org" "GridFire-UI") "* TODO %?")
        ("E" "Emacs"       entry (file+headline "~/org/tech-journal.org" "Emacs/Spacemacs") "* %?")
        ("A" "Sysadmin"    entry (file+headline "~/org/todo/agenda.org" "Sysadmin"   ) "* TODO %?")
        ("j" "Journal entry" plain (function org-journal-find-location)
         "** %(format-time-string org-journal-time-format)%^{Title}\n%i%?" :jump-to-captured t :immediate-finish t)
        ("M" "Misc"        entry (file+headline "~/org/todo/agenda.org" "Misc"       ) "* TODO %?")))

;; ("j" "Clojure"     entry (file+headline "~/org/todo/agenda.org" "Clojure"    ) "* TODO %?")


;; Define default TODO keywords and their faces
(setq org-todo-keywords '((sequence  "TODO" "STARTED" "|" "DONE" "CANCELED"))
      org-todo-keyword-faces '(("TODO"     :foreground "red"          :weight bold)
                               ("STARTED"  :foreground "orange"       :weight bold)
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
  (add-to-list 'org-structure-template-alist '("S" "#+name: ?\n#+begin_src \n\n#+end_src" "<src id=\"?\" lang=\"\">\n\n</src>"))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (shell      . t)
     (sql        . t)
     (dot        . t)
     (gnuplot    . t)
     (clojure    . t)
     ))
  (setq org-src-window-setup         'current-window
        org-src-fontify-natively     t
        org-confirm-babel-evaluate   nil
        org-src-fontify-natively     t
        org-src-preserve-indentation t))

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
                                 ("fontsize"        "\\footnotesize")
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
                           ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))

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
