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

(provide 'general-settings)
