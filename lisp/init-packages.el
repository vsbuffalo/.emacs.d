;; Package Settings

;; Initialize package manager
(when (>= emacs-major-version 24)
    (require 'package)
      (package-initialize)
      (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))
(when (< emacs-major-version 24)
    (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(defun require-package (package &optional min-version no-refresh)
  ;; From https://github.com/purcell/emacs.d/blob/master/lisp/init-elpa.el
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
	(package-install package)
      (progn
	(package-refresh-contents)
	(require-package package min-version t)))))

(setq package-enable-at-startup nil)
(package-initialize)

(provide 'init-packages)
