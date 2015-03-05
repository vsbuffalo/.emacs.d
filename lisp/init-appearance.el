;; Theme-related configurations

(set-default-font "Inconsolata 11")

(require-package 'color-theme)
(require-package 'color-theme-solarized)

;; Display column number
(column-number-mode t)

;; Color theme
(setq solarized-termcolors 256)
(load-theme 'solarized t)
(setq background-mode 'dark)
(enable-theme 'solarized)


(provide 'init-appearance)
