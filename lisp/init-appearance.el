;; Theme-related configurations

(set-default-font "Inconsolata 11")

(require-package 'color-theme)
;; (require-package 'zenburn-theme)
(require-package 'color-theme-solarized)

;; Display column number
(column-number-mode t)

;; Color theme
(load-theme 'solarized-dark t)

(provide 'init-appearance)
