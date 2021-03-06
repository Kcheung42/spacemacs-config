;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;;; Code:
(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will

   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '
   (
    yaml
    html
    python
    ;; (python :variables flycheck-python-pycompile-executable 'python3)
    react
    ruby
    csv
    (sql :variables
         sql-capitalize-keywords t)
    (markdown :variables
              markdown-live-preview-engine 'vmd)
    (clojure :variables
             clojure-indent-style 'always-indent)
    (javascript :variables
                node-add-modules-path t)
    (java :variables
          java-backend 'eclim
          eclim-eclipse-dirs '("~/eclipse/")
          eclim-executable "~/eclipse/plugins/org.eclim_2.8.0/bin/eclim")
    chrome
    docker
    nginx
    ;; ----------------------------------------------------------------
    ;; Example of useful layers you may want to use right away.
    ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
    ;; <M-m f e R> (Emacs style) to install them.
    ;; ----------------------------------------------------------------
    (org :variables
         org-enable-org-journal-support t
         org-agenda-integration t
         org-journal-dir "~/org/journal/"
         org-journal-file-format "%Y-%m-%d"
         org-journal-date-prefix "#+TITLE: "
         org-journal-date-format "%A, %B %d %Y"
         org-journal-time-prefix "* "
         org-journal-time-format ""
         )
    helm
    git
    auto-completion
    better-defaults
    emacs-lisp
    (shell :variables
           shell-default-position 'bottom
           )
    themes-megapack
    ;; theming
    ;; (shell :variables
    ;;        shell-default-height 30
    ;;        shell-default-position 'bottom)
    ;; spell-checking
    syntax-checking
    ;; version-control
    )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     evil-mc
     yasnippet-snippets
     nodejs-repl
     prettier-js
     rjsx-mode
     graphql-mode
     aggressive-indent
     org-journal
     forge
     org-preview-html
     emacsql-sqlite3
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(company-tern)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun my-setup-indent (n)
  ;;java/c/c++
  (setq c-basic-offset n)
  ;;web development
  (setq coffee-tab-width n) ; coffeescript
  (setq javascript-indent-level n) ; javascript-mode
  (setq js-indent-level n) ; js-mode
  (setq js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq css-indent-offset n) ; css-mode
  )

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.

   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         gruvbox-dark-medium
                         spacemacs-dark
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro for Powerline"
                               :size 22
                               :weight light
                               :width extra-condensed
                               :powerline-scale 2)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-mode-line-theme 'spacemacs
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers 'relative
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (my-setup-indent 2) ; indent 2 spaces width
  (require 'tramp)
  (setq theming-modifications '(
                                ;; requires the theming layer
                                ;; (gruvbox-dark-soft
                                ;;  (font-lock-doc-face :foreground "#7c6f64")
                                ;; )
                                ))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."



  ;; (add-to-list 'exec-path "/usr/bin/sqlite3")

  ;;============================================================================
  ;;
  ;; WSL
  ;;
  ;;============================================================================

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

  ;;============================================================================
  ;; WSL End
  ;;============================================================================


  ;; (setq org-todo-keywords
  ;;       '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))


  ;;============================================================================
  ;;
  ;; org-mode
  ;;
  ;;============================================================================

  ;;===============
  ;; org-journal
  ;;==============

  (setq org-journal-carryover-items '((sequence  "TODO" "STARTED")))

  ;; You can configure a capture template in order to integrate org-journal with
  ;; org-capture, as in the following example for a daily journal:
  (defun org-journal-find-location ()
    ;; Open today's journal, but specify a non-nil prefix argument in order to
    ;; inhibit inserting the heading; org-capture will insert the heading.
    (org-journal-new-entry t)
    ;; Position point on the journal's top-level heading so that org-capture
    ;; will add the new entry as a child entry.
    (goto-char (point-min)))


  ;; (defun org-journal-file-header-func (time)
  ;;   "Custom function to create journal header."
  ;;   (concat
  ;;    (pcase org-journal-file-type
  ;;      (`daily "#+TITLE: Daily Journal\n#+STARTUP: showeverything")
  ;;      (`weekly "#+TITLE: Weekly Journal\n#+STARTUP: folded")
  ;;      (`monthly "#+TITLE: Monthly Journal\n#+STARTUP: folded")
  ;;      (`yearly "#+TITLE: Yearly Journal\n#+STARTUP: folded"))))

  ;; (setq org-capture-templates '(("j" "Journal entry" entry (function
  ;;                                                           org-journal-find-location)
  ;;                                                               "*
  ;;                                                           %(format-time-string
  ;;                                                           org-journal-time-format)%^{Title}\n%i%?")))

  (setq org-journal-file-header 'org-journal-file-header-func)

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
        org-hide-emphasis-markers t
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
        org-enforce-todo-checkbox-dependencies nil)

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
          ("E" "Emacs"       entry (file+headline "~/org/todo/agenda.org" "Emacs"      ) "* TODO %?")
          ("j" "Clojure"     entry (file+headline "~/org/todo/agenda.org" "Clojure"    ) "* TODO %?")
          ("A" "Sysadmin"    entry (file+headline "~/org/todo/agenda.org" "Sysadmin"   ) "* TODO %?")
          ("M" "Misc"        entry (file+headline "~/org/todo/agenda.org" "Misc"       ) "* TODO %?")))

  ;; Define default TODO keywords and their faces
  (setq org-todo-keywords '((sequence  "TODO" "STARTED" "|" "DONE"))
        org-todo-keyword-faces '(("TODO"    :foreground "red"          :weight bold)
                                 ("STARTED" :foreground "orange"       :weight bold)
                                 ("DONE"    :foreground "forest green" :weight bold)))

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

          org-src-preserve-indentation t))

  ;; Pull in the htmlize library for pretty source code in HTML output
  (require 'htmlize)

  ;; Add additional output formats to the org-mode exporter
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
  ;;
  ;; Org End
  ;;
  ;;============================================================================

  ;; rebind brackets anc convenient, Not working that well
  ;; (define-key evil-insert-state-map (kbd "C-k") (kbd "["))
  ;; (define-key evil-insert-state-map (kbd "C-l") (kbd "("))
  ;; (evil-define-key 'insert key-translation-map (kbd "kk") (kbd "["))


  ;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

  ;; automatically wrap text past column limit
  (setq-default auto-fill-function 'do-auto-fill)

  (spacemacs/toggle-indent-guide-globally-on)
  ;; don't jump t e cursor around in the window on clicking
  (with-eval-after-load 'evil-states
    (define-key evil-motion-state-map [down-mouse-1] 'silence)
    ;; also avoid any '<mouse-1> is undefined' when setting to 'undefined
    (define-key evil-motion-state-map [mouse-1] 'silence)
    )

  (global-evil-mc-mode t)

  ;; Set Default Shell
  ;; (setq-default dotspacemacs-configuration-layers
  ;;               '((
  ;;                  nginx
  ;;                  typescript
  ;;                  clojureshell :variables
  ;;                  )))
  ;; (custom-set-faces
  ;;  '(term ((t (:inherit default)))))

  ;; Starcity
  ;; (exec-path-from-shell-copy-env "STARCITY_SECRETS")

  ;;============================================================================
  ;;
  ;; Python
  ;;
  ;;============================================================================

  ;; fixing yas-snippet directory error
  ;; added 06-01-19
  (setq yas-snippet-dirs
        '("~/.emacs.d/private/snippets"                 ;; personal snippets
          ;; "/path/to/some/collection/"           ;; foo-mode and bar-mode snippet collection
          ;; "/path/to/yasnippet/yasmate/snippets" ;; the yasmate collection
          ))

  (add-hook 'python-mode-hook
            (lambda ()
              (setq indent-tabs-mode nil)
              (setq tab-width 4)
              (setq python-indent-offset 4)))
  ;;============================================================================
  ;;
  ;; Python End
  ;;
  ;;============================================================================


  ;;----- Clojure Start-----
  ;; (global-aggressive-indent-mode 1)
  ;; (add-hook 'clojure-mode-hook #'aggressive-indent-mode)
  (setq clojure-indent-style 'align-arguments)
  (setq clojure-align-forms-automatically t)

  (setq dotspacemacs-smart-closing-parenthesis t)
  ;;----- Clojure End-----

  ;;----- Javascript -----
  ;; (with-eval-after-load 'web-mode
  ;;   (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
  ;;   (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
  ;;   (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil)))

  ;; (setq js2-strict-missing-semi-warning nil)

  ;; (eval-after-load 'web-mode
  ;;   '(progn
  ;;      (add-hook 'web-mode-hook #'add-node-modules-path)))

  ;; nodejs-repl
  (spacemacs/set-leader-keys-for-major-mode 'js2-mode "ne" 'nodejs-repl-send-last-expression)
  (spacemacs/set-leader-keys-for-major-mode 'js2-mode "nj" 'nodejs-repl-send-line)
  (spacemacs/set-leader-keys-for-major-mode 'js2-mode "nr" 'nodejs-repl-send-region)
  (spacemacs/set-leader-keys-for-major-mode 'js2-mode "nl" 'nodejs-repl-load-file)
  (spacemacs/set-leader-keys-for-major-mode 'js2-mode "n'" 'nodejs-repl-switch-to-repl)
  (spacemacs/set-leader-keys-for-major-mode 'js2-mode "ns" 'nodejs-repl-switch-to-repl)

  ;; React
  (add-to-list 'auto-mode-alist '("\\.js\\'"    . rjsx-mode))

  ;; use eslint from node modules dicetory
  (add-hook 'prog-mode-hook 'flycheck-mode)
  (defun my/use-eslint-from-node-modules ()
    (let* ((root (locate-dominating-file
                  (or (buffer-file-name) default-directory)
                  "node_modules"))
           (eslint (and root
                        (expand-file-name "node_modules/eslint/bin/eslint.js"
                                          root))))
      (when (and eslint (file-executable-p eslint))
        (setq-local flycheck-javascript-eslint-executable eslint))))
  (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

  ;; Tide setup
  ;; (defun setup-tide-mode ()
  ;;   (interactive)
  ;;   (tide-setup)
  ;;   (flycheck-mode +1)
  ;;   ;;  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  ;;   (eldoc-mode +1)
  ;;   (tide-hl-identifier-mode +1)
  ;;   (company-mode +1))
  ;; ;; aligns annotation to the right hand side
  ;; (setq company-tooltip-align-annotations t)
  ;; (setq tide-completion-ignore-case t)
  ;; ;; formats the buffer before saving
  ;; ;;(add-hook 'before-save-hook 'tide-format-before-save)
  ;; (add-hook 'js2-mode-hook #'setup-tide-mode)
  ;; (add-hook 'rjsx-mode-hook #'setup-tide-mode)
  ;; (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)
  ;; (setq tide-format-options
  ;;       '(:indentSize 2 :tabSize 2))



  ;;----- Javascript End-----


  ;;----- Java Start-----
  ;; (setq
  ;;  ;; Specify the workspace to use by default
  ;;  eclimd-default-workspace "/home/kcheung/Java/"
  ;;  ;; whether autostarting eclimd or not (default nil)
  ;;  eclimd-autostart t
  ;;  ;; Whether or not to block emacs until eclimd is ready (default nil)
  ;; eclimd-wait-for-process t)

  ;; regular auto-complete initialization
  (require 'auto-complete-config)
  (ac-config-default)

  ;; add the emacs-eclim source
  ;; (require 'ac-emacs-eclim-source)
  ;; (ac-emacs-eclim-config)
  ;;----- Java End-----

  ;; Allow propper Django html template files syntax highlight
  ;; (require 'web-mode)
  ;; (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))


  (defun spacemacs/python-remove-unused-imports()
    "Use Autoflake to remove unused function"
    "autoflake --remove-all-unused-imports -i unused_imports.py"
    (interactive)
    (if (executable-find "autoflake")
        (progn
          (shell-command (format "autoflake --remove-all-unused-imports -i %s"
                                 (shell-quote-argument (buffer-file-name))))
          (revert-buffer t t t))
      (message "Error: Cannot find autoflake executable.")))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#3c3836" "#fb4933" "#b8bb26" "#fabd2f" "#83a598" "#d3869b" "#8ec07c" "#ebdbb2"])
 '(beacon-color "#d33682")
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#689d6a")
 '(cua-normal-cursor-color "#7c6f64")
 '(cua-overwrite-cursor-color "#b57614")
 '(cua-read-only-cursor-color "#98971a")
 '(custom-safe-themes
   (quote
    ("4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" "939ea070fb0141cd035608b2baabc4bd50d8ecc86af8528df9d41f4d83664c6a" "585942bb24cab2d4b2f74977ac3ba6ddbd888e3776b9d2f993c5704aa8bb4739" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#073642" t)
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(frame-background-mode (quote dark))
 '(helm-completion-style (quote emacs))
 '(highlight-changes-colors (quote ("#d3869b" "#8f3f71")))
 '(highlight-symbol-colors
   (quote
    ("#ecd19a" "#d5dbae" "#eabb92" "#e0c3b1" "#e3d99d" "#eec394" "#c5ccb3")))
 '(highlight-symbol-foreground-color "#665c54")
 '(highlight-tail-colors
   (quote
    (("#ebdbb2" . 0)
     ("#c6c148" . 20)
     ("#82cc73" . 30)
     ("#5b919b" . 50)
     ("#e29a3f" . 60)
     ("#df6835" . 70)
     ("#f598a7" . 85)
     ("#ebdbb2" . 100))))
 '(hl-bg-colors
   (quote
    ("#e29a3f" "#df6835" "#cf5130" "#f598a7" "#c2608f" "#5b919b" "#82cc73" "#c6c148")))
 '(hl-fg-colors
   (quote
    ("#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7")))
 '(hl-sexp-background-color "#efebe9")
 '(lsp-ui-doc-border "#665c54")
 '(nrepl-message-colors
   (quote
    ("#9d0006" "#af3a03" "#b57614" "#747400" "#c6c148" "#004858" "#689d6a" "#d3869b" "#8f3f71")))
 '(package-selected-packages
   (quote
    (org-journal sql-indent leuven-theme doom-gruvbox-theme doom-themes gnu-elpa-keyring-update org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download htmlize gnuplot graphql-mode rjsx-mode prettier-js color-theme-sanityinc-tomorrow nodejs-repl lv parseedn parseclj a nginx-mode dockerfile-mode docker tablist docker-tramp company-emacs-eclim eclim company-tern tern yasnippet-snippets unfill mwim flycheck-pos-tip pos-tip flycheck helm-company helm-c-yasnippet fuzzy flyspell-correct-helm flyspell-correct company-web web-completion-data company-statistics company-anaconda company clojure-snippets auto-yasnippet auto-dictionary ac-ispell auto-complete smeargle orgit magit-gitflow magit-popup helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit transient git-commit with-editor vmd-mode gmail-message-mode ham-mode html-to-markdown flymd edit-server xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help yaml-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode anaconda-mode pythonic zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby csv-mode mmm-mode markdown-toc markdown-mode gh-md web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc coffee-mode solidity-mode space-gray-theme Monokai-theme sublime-themes clj-refactor inflections edn multiple-cursors paredit yasnippet peg cider-eval-sexp-fu cider sesman seq queue clojure-mode ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(pdf-view-midnight-colors (quote ("#fdf4c1" . "#32302f")))
 '(pos-tip-background-color "#ebdbb2")
 '(pos-tip-foreground-color "#665c54")
 '(safe-local-variable-values
   (quote
    ((cider-ns-refresh-after-fn . "integrant.repl/resume")
     (cider-ns-refresh-before-fn . "integrant.repl/suspend"))))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#98971a" "#ebdbb2" 0.2))
 '(term-default-bg-color "#282828")
 '(term-default-fg-color "#a89984")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#cb4b16")
     (60 . "#b58900")
     (80 . "#859900")
     (100 . "#2aa198")
     (120 . "#268bd2")
     (140 . "#d33682")
     (160 . "#6c71c4")
     (180 . "#dc322f")
     (200 . "#cb4b16")
     (220 . "#b58900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#d33682")
     (320 . "#6c71c4")
     (340 . "#dc322f")
     (360 . "#cb4b16"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#fbf1c7" "#ebdbb2" "#750000" "#9d0006" "#747400" "#98971a" "#8a5100" "#b57614" "#004858" "#076678" "#9f4d64" "#d3869b" "#2e7d33" "#689d6a" "#7c6f64" "#3c3836")))
 '(window-divider-mode nil)
 '(xterm-color-names
   ["#ebdbb2" "#9d0006" "#98971a" "#b57614" "#076678" "#d3869b" "#689d6a" "#32302f"])
 '(xterm-color-names-bright
   ["#fbf1c7" "#af3a03" "#a89984" "#3c3836" "#7c6f64" "#8f3f71" "#665c54" "#282828"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro for Powerline" :foundry "ADBO" :slant normal :weight normal :height 104 :width normal))))
 '(show-paren-match ((t (:background "white smoke" :foreground "#83a598" :weight bold)))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(ansi-color-faces-vector
     [default bold shadow italic underline bold bold-italic bold])
   '(ansi-color-names-vector
     ["#3c3836" "#fb4933" "#b8bb26" "#fabd2f" "#83a598" "#d3869b" "#8ec07c" "#ebdbb2"])
   '(beacon-color "#d33682")
   '(compilation-message-face (quote default))
   '(cua-global-mark-cursor-color "#689d6a")
   '(cua-normal-cursor-color "#7c6f64")
   '(cua-overwrite-cursor-color "#b57614")
   '(cua-read-only-cursor-color "#98971a")
   '(custom-safe-themes
     (quote
      ("4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" "939ea070fb0141cd035608b2baabc4bd50d8ecc86af8528df9d41f4d83664c6a" "585942bb24cab2d4b2f74977ac3ba6ddbd888e3776b9d2f993c5704aa8bb4739" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" default)))
   '(evil-want-Y-yank-to-eol nil)
   '(fci-rule-color "#073642")
   '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
   '(frame-background-mode (quote dark))
   '(helm-completion-style (quote emacs))
   '(highlight-changes-colors (quote ("#d3869b" "#8f3f71")))
   '(highlight-symbol-colors
     (quote
      ("#ecd19a" "#d5dbae" "#eabb92" "#e0c3b1" "#e3d99d" "#eec394" "#c5ccb3")))
   '(highlight-symbol-foreground-color "#665c54")
   '(highlight-tail-colors
     (quote
      (("#ebdbb2" . 0)
       ("#c6c148" . 20)
       ("#82cc73" . 30)
       ("#5b919b" . 50)
       ("#e29a3f" . 60)
       ("#df6835" . 70)
       ("#f598a7" . 85)
       ("#ebdbb2" . 100))))
   '(hl-bg-colors
     (quote
      ("#e29a3f" "#df6835" "#cf5130" "#f598a7" "#c2608f" "#5b919b" "#82cc73" "#c6c148")))
   '(hl-fg-colors
     (quote
      ("#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7")))
   '(hl-sexp-background-color "#efebe9")
   '(hl-todo-keyword-faces
     (quote
      (("TODO" . "#dc752f")
       ("NEXT" . "#dc752f")
       ("THEM" . "#2d9574")
       ("PROG" . "#4f97d7")
       ("OKAY" . "#4f97d7")
       ("DONT" . "#f2241f")
       ("FAIL" . "#f2241f")
       ("DONE" . "#86dc2f")
       ("NOTE" . "#b1951d")
       ("KLUDGE" . "#b1951d")
       ("HACK" . "#b1951d")
       ("TEMP" . "#b1951d")
       ("FIXME" . "#dc752f")
       ("XXX+" . "#dc752f")
       ("\\?\\?\\?+" . "#dc752f"))))
   '(lsp-ui-doc-border "#665c54")
   '(nrepl-message-colors
     (quote
      ("#9d0006" "#af3a03" "#b57614" "#747400" "#c6c148" "#004858" "#689d6a" "#d3869b" "#8f3f71")))
   '(package-selected-packages
     (quote
      (org-preview-html org-journal sql-indent leuven-theme doom-gruvbox-theme doom-themes gnu-elpa-keyring-update org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download htmlize gnuplot graphql-mode rjsx-mode prettier-js color-theme-sanityinc-tomorrow nodejs-repl lv parseedn parseclj a nginx-mode dockerfile-mode docker tablist docker-tramp company-emacs-eclim eclim company-tern tern yasnippet-snippets unfill mwim flycheck-pos-tip pos-tip flycheck helm-company helm-c-yasnippet fuzzy flyspell-correct-helm flyspell-correct company-web web-completion-data company-statistics company-anaconda company clojure-snippets auto-yasnippet auto-dictionary ac-ispell auto-complete smeargle orgit magit-gitflow magit-popup helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit transient git-commit with-editor vmd-mode gmail-message-mode ham-mode html-to-markdown flymd edit-server xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help yaml-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode anaconda-mode pythonic zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby csv-mode mmm-mode markdown-toc markdown-mode gh-md web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc coffee-mode solidity-mode space-gray-theme Monokai-theme sublime-themes clj-refactor inflections edn multiple-cursors paredit yasnippet peg cider-eval-sexp-fu cider sesman seq queue clojure-mode ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
   '(pdf-view-midnight-colors (quote ("#fdf4c1" . "#32302f")))
   '(pos-tip-background-color "#ebdbb2")
   '(pos-tip-foreground-color "#665c54")
   '(safe-local-variable-values
     (quote
      ((cider-clojure-cli-global-options . "-A:figwheel-lib")
       (cider-figwheel-main-default-options . "compile-dev")
       (cider-default-cljs-repl . figwheel-main)
       (cider-ns-refresh-after-fn . "integrant.repl/resume")
       (cider-ns-refresh-before-fn . "integrant.repl/suspend"))))
   '(smartrep-mode-line-active-bg (solarized-color-blend "#98971a" "#ebdbb2" 0.2))
   '(term-default-bg-color "#282828")
   '(term-default-fg-color "#a89984")
   '(vc-annotate-background nil)
   '(vc-annotate-background-mode nil)
   '(vc-annotate-color-map
     (quote
      ((20 . "#dc322f")
       (40 . "#cb4b16")
       (60 . "#b58900")
       (80 . "#859900")
       (100 . "#2aa198")
       (120 . "#268bd2")
       (140 . "#d33682")
       (160 . "#6c71c4")
       (180 . "#dc322f")
       (200 . "#cb4b16")
       (220 . "#b58900")
       (240 . "#859900")
       (260 . "#2aa198")
       (280 . "#268bd2")
       (300 . "#d33682")
       (320 . "#6c71c4")
       (340 . "#dc322f")
       (360 . "#cb4b16"))))
   '(vc-annotate-very-old-color nil)
   '(weechat-color-list
     (quote
      (unspecified "#fbf1c7" "#ebdbb2" "#750000" "#9d0006" "#747400" "#98971a" "#8a5100" "#b57614" "#004858" "#076678" "#9f4d64" "#d3869b" "#2e7d33" "#689d6a" "#7c6f64" "#3c3836")))
   '(window-divider-mode nil)
   '(xterm-color-names
     ["#ebdbb2" "#9d0006" "#98971a" "#b57614" "#076678" "#d3869b" "#689d6a" "#32302f"])
   '(xterm-color-names-bright
     ["#fbf1c7" "#af3a03" "#a89984" "#3c3836" "#7c6f64" "#8f3f71" "#665c54" "#282828"]))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(default ((t (:family "Source Code Pro for Powerline" :foundry "ADBO" :slant normal :weight normal :height 104 :width normal))))
   '(show-paren-match ((t (:background "white smoke" :foreground "#83a598" :weight bold)))))
  )
