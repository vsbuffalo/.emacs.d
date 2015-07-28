;; Yas snippet


(require-package 'yasnippet)

(setq yas-snippet-dirs '("~/.emacs.d/local-snippets/"
			 "~/.emacs.d/snippets"))

(yas-global-mode 1)

(provide 'init-yas)
