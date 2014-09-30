;; Autocomplete settings

;; Newest popup if neede
;;(auto-install-from-url "https://github.com/m2ym/popup-el/raw/master/popup.el")
(require-package 'popup)
(require 'popup)

(require-package 'auto-complete)
(require-package 'auto-complete-clang-async)
(add-hook 'after-init-hook 'global-company-mode)

;; set very short delay
(setq ac-quick-help-delay 0.1) 

;; Jedi
(require-package 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(setq jedi:get-in-function-call-delay 300)

;; auto-complete-clang-async
(require-package 'auto-complete-clang-async)
(require 'auto-complete-clang-async)

(require 'auto-complete-clang-async)

(defun ac-cc-mode-setup ()
    (setq ac-clang-complete-executable "~/.emacs.d/clang-complete")
      (setq ac-sources '(ac-source-clang-async))
        (ac-clang-launch-completion-process))

(defun ac-common-setup ()
    ())
(defun my-ac-config ()
    (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
      (add-hook 'auto-complete-mode-hook 'ac-common-setup)
        (global-auto-complete-mode t))

(my-ac-config)

(provide 'init-complete)
