;; Theme-related configurations

(set-default-font "Inconsolata 11")

(require-package 'color-theme)
(require-package 'color-theme-solarized)

;; Display column number
(column-number-mode t)

;; Color theme
(custom-set-variables '(solarized-termcolors 256))
(load-theme 'solarized t)

;; hack to fix this;
;; https://github.com/jramnani/dotfiles/commit/da57ec2fd477d739a1a3597ccef4d96f4e35b504
;; see: https://github.com/sellout/emacs-color-theme-solarized/issues/142
(set-frame-parameter nil 'background-mode 'dark)
(when (not (display-graphic-p))
  (set-terminal-parameter nil 'background-mode 'dark))
;; Call enable-theme to pick up the change to 'background-mode.
(enable-theme 'solarized)

(provide 'init-appearance)
