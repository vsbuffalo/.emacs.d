;; General Settings - settings across all modes
;;
;; Any aesthetic settings such as color themes, cursor, etc are in
;; visual.el

;; Don't use dialog boxes
(setq use-dialog-box nil)

;; Tab settings
(setq-default indent-tabs-mode nil)
(setq tab-width 2)

;; Scroll to the bottom of interpreter (ESS or shell) on input or
;; output.
(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)
(setq comint-move-point-for-output t)

;; Parentheses matching
(require 'paren)
(show-paren-mode t)

;; Allow repeated cycling through mark ring
(setq set-mark-command-repeat-pop t)
;; Set higher mark ring maximum
(setq mark-ring-max 64)
(setq global-ring-max 64)

;; Enable file backups
(setq version-control t)
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))
(setq delete-old-versions t)

;; Enable buffer-swapping
(require 'buffer-move)
(global-set-key (kbd "C-S-<up>") 'buf-move-up)
(global-set-key (kbd "C-S-<down>") 'buf-move-down)
(global-set-key (kbd "C-S-<left>") 'buf-move-left)
(global-set-key (kbd "C-S-<right>") 'buf-move-right)

;; Make M-<delete> (the key above left-arrow) delete right
(global-set-key (kbd "<M-kp-delete>") 'kill-word)
(global-set-key (kbd "<kp-delete>") 'delete-char)

;; Turn on delete-selection-mode, which deletes selected text when
;; typing starts
(delete-selection-mode t)


;; Make emacs shell prompts read-only and jump to end of buffer when
;; there is output
(setq comint-prompt-read-only t)
(setq comint-move-point-for-output t)
(setq comint-scroll-to-bottom-on-input t)


;; Make Grep's default command recursive
(setq grep-command "grep -nHr -e")