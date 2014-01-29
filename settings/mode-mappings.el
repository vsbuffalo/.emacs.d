;;;; mode-mappings.el -- Like Magnar's ~/.emacs.d, have a separate mode mapping file.

;; CSS
(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))

;; HTML
(add-to-list 'auto-mode-alist '("\\.html\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.xhtml\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.xml\\'" . nxml-mode))

;; Snippets
(add-to-list 'auto-mode-alist '("yasnippet/snippets" . snippet-mode))
(add-to-list 'auto-mode-alist '("\\.yasnippet$" . snippet-mode))

;; Markdown
(autoload 'markdown-mode "markdown-mode")
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-hook 'markdown-mode-hook (lambda () (define-key markdown-mode-map (kbd "<tab>") 'yas/expand)))

;; org-mode
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; ESS
(add-to-list 'auto-mode-alist '("\\.R$" . r-mode))
(add-to-list 'auto-mode-alist '("\\.Rnw\\'" . Rnw-mode))

;; doc-mode
(add-to-list 'auto-mode-alist '("\\.asciidoc$" . adoc-mode))

(provide 'mode-mappings)
