;;;; ido-settings.el -- ido-mode settings

(require 'ido)
(ido-mode t)
;; enable fuzzy matching:
(setq ido-enable-flex-matching t)

;; Use ido everywhere
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

(provide 'ido-settings)
