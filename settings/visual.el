;; Visual Settings --- Setting the aesthetics of Emacs

;; Cursor type
(setq-default cursor-type 'bar)
(blink-cursor-mode t)

;; Display column number
(column-number-mode t)

;; Make uniquely named buffers for easier C-x C-b'ing
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")


;; Color-theme settings
(when (eq window-system 'ns)
  ;; Set window sizes
  (add-to-list 'default-frame-alist '(left . 0))
  (add-to-list 'default-frame-alist '(top . 0))
  (add-to-list 'default-frame-alist '(height . 80))
  (add-to-list 'default-frame-alist '(width . 155))

  (require 'color-theme)
  (eval-after-load "color-theme"
    '(progn
       (color-theme-initialize)
       (color-theme-tango))))