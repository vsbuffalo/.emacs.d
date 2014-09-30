;; ido-mode settings

(require-package 'ido)
(require-package 'ido-ubiquitous)

(require 'ido)
(ido-mode t)

;; enable fuzzy matching:
(setq ido-enable-flex-matching t)

;; Use ido everywhere
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

(setq ido-ignore-buffers '("^ " "*Completions*" "*Shell Command Output*"
			   "*Messages*" "Async Shell Command"))

(provide 'init-ido)
