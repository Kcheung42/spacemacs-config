;;; package  --- Summary

;;; Commentary:

;;; Code:
(require 'web-mode)

;; Allow propper Django html template files syntax highlight
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(provide 'my-django)
;;; my-django.el ends here
