;; General Settings - settings across all modes
;;
;; Any aesthetic settings such as color themes, cursor, etc are in
;; visual.el

;; Scroll to the bottom of interpreter (ESS or shell) on input or
;; output.
(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)
(setq comint-move-point-for-output t)

;; Don't use dialog boxes
(setq use-dialog-box nil)

;; Following Steve Yegge's advice, configure M-x to these.
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; Set transient mark mode
(setq transient-mark-mode t)

;; Don't give me that pleasant start up message
(setq inhibit-startup-message t)

;; Tab settings
(setq-default indent-tabs-mode nil)
(setq tab-width 2)

;; Allow me to answer y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Increase the undo limit significantly
(setq undo-limit 100000) 

;; Disable that stupid toolbar and menu bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

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
(global-set-key (kbd "S-<up>") 'buf-move-up)
(global-set-key (kbd "S-<down>") 'buf-move-down)
(global-set-key (kbd "S-<left>") 'buf-move-left)
(global-set-key (kbd "S-<right>") 'buf-move-right)

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
(setq grep-command "grep -nHr -e ")

;; Window resizing shortcuts
(defun enlarge-window-again ()
  "This is designed to be bound to ^, such that consecutive ^
keystrokes continue to enlarge the window."
  (interactive)
  (if (or (eql last-command 'enlarge-window) 
          (eql last-command 'enlarge-window-again))
      (enlarge-window 1)
    (insert "^")))
(global-set-key (kbd "^") 'enlarge-window-again)

;; Even more accessible window resizing
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; turn on line highlighting
;; (global-hl-line-mode t)
(set-face-background 'hl-line "#663300")
(set-face-foreground 'hl-line "#FFF")

;; Turn on fixme mode
(require 'fixme-mode)