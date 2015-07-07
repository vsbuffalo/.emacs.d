;;; init.el -- initialize globals, install any necessary packages, and
;;;; load important stuff early

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Load some core package
(require 'init-packages)
(require-package 'auto-install)
(require 'auto-install)

;; Load settings
(require 'init-general) ;; contains some general packages too
(require 'init-evil)
(require 'init-ido)
(require 'init-ess)
(require 'init-appearance)
(require 'init-keys)
(require 'init-complete)
(require 'init-asciidoc)
(require 'init-markdown)
(require 'init-org)
(require 'init-multiterm)
(require 'init-js)

;; Start emacs server, so emacsclient is supported
(require 'server)
(unless (server-running-p)
    (server-start))





