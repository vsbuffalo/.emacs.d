;; ESS settings

(require-package 'ess)

(require 'ess-site)
(setq ess-indent-level 2)
(setq ess-eval-visibly-p nil)

;; ess autocomplete
(setq ess-use-auto-complete 'script-only)

(provide 'init-ess)
