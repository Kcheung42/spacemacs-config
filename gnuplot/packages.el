;;; package  --- Summary

;;; Commentary:

(require 'ob)
(require 'ob-gnuplot)
(require 'ob-clojure)
(require 'cider)

;;; Code:
(setq org-babel-clojure-backend 'cider)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (gnuplot    . t)
   (clojure    . t)))
;;; packages.el ends here
