;;;; init.el -- initialize globals, install any necessar packages, and
;;;; load important stuff early

;;; Disable some configurations immediately to decrease load time

;; Disable that stupid toolbar and menu bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Don't give me that pleasant start up message
(setq inhibit-startup-message t)

;;;; Load Path 
(add-to-list 'load-path user-emacs-directory)

;; Settings in settings directory 
(add-to-list 'load-path (expand-file-name "settings" user-emacs-directory))

;; Other relevant directories
(defvar *snippet-dir* 
  (expand-file-name "snippets" user-emacs-directory))

;; Setup packages
(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   (cons 'gist melpa)
   (cons 'ess melpa)
   (cons 'yasnippet melpa)
   (cons 'adoc-mode marmalade)
   (cons 'ido-ubiquitous melpa)
   (cons 'js2-mode melpa)
   (cons 'markdown-mode melpa)
   (cons 'buffer-move marmalade)
   (cons 'multiple-cursors marmalade)))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; Load setup files
(require 'general-settings)
(eval-after-load 'ido '(require 'ido-settings))
(eval-after-load 'org '(require 'org-settings))

;; Load other setup files
(require 'appearance-settings) ; adjusts visual settings
(require 'interface-settings) ; adjusts user interaction settings
(require 'doc-mode-settings)
(require 'ess-settings)
(require 'ido-settings)
(require 'multiple-cursors-settings)
(require 'shell-settings)
(require 'yasnippet-settings)

;; Load mode mappings
(require 'mode-mappings)
