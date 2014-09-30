;; asciidoc settings

(require-package 'adoc-mode)
(require 'adoc-mode)

(add-to-list 'auto-mode-alist '("\\.doc$" . adoc-mode))
(add-to-list 'auto-mode-alist '("\\.asciidoc$" . adoc-mode))

(provide 'init-asciidoc)
