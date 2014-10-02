;; Markdown settings

(require-package 'markdown-mode)

(require 'markdown-mode)

(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))

(provide 'init-markdown)
