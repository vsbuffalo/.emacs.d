;;;; doc-mode-settings.el

(autoload 'doc-mode "doc-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.asciidoc$" . doc-mode))

(provide 'doc-mode-settings)
