;; ESS settings

(require-package 'ess)

(require 'ess-site)
(setq ess-indent-level 2)
(setq ess-eval-visibly-p nil)

;; ess autocomplete
(setq ess-use-auto-complete 'script-only)

;; polymode for Rmd, etc. support
(require-package 'polymode)
(require 'polymode)

;; R modes
(add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))

(require 'poly-R)
(require 'poly-markdown)

(provide 'init-ess)
