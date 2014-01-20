;;;; General Setup

;; Increase the undo limit significantly
(setq undo-limit 100000) 

;; Enable file backups
(setq version-control t)
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))
(setq delete-old-versions t)

;; Add support for clearing shells
(defun clear-shell ()
   (interactive)
   (let ((old-max comint-buffer-maximum-size))
     (setq comint-buffer-maximum-size 0)
     (comint-truncate-buffer)
     (setq comint-buffer-maximum-size old-max)))
(global-set-key  (kbd "\C-x c") 'clear-shell)

;; instant access to init.el
;; http://emacsredux.com/blog/2013/05/18/instant-access-to-init-dot-el/
(defun find-user-init-file ()
  "Edit the `user-init-file', in another window."
  (interactive)
  (find-file-other-window user-init-file))
(global-set-key (kbd "C-c I") 'find-user-init-file)

;; Scrolling makes noise when I hit top; turn this off.
(setq ring-bell-function 'ignore)

(provide 'general-settings)

