;;;; mode-mappings.el -- Like Magnar's ~/.emacs.d, have a separate mode mapping file.

;; CSS
(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))

;; HTML
(add-to-list 'auto-mode-alist '("\\.html\\'" . html-mode))

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

(provide 'mode-mappings)
