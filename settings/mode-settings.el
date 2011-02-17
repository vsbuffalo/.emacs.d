;; Mode Settings
;;
;; All settings for modes like python-mode, ESS, etc are here

;; ========== Auto Insert ==========
(require 'autoinsert)
(auto-insert-mode)  ;;; Adds hook to find-files-hook
(setq auto-insert-directory "~/.emacs.d/templates/")
(setq auto-insert-query nil)

;; ========== nxml-mode ==========
(add-to-list 'auto-mode-alist
             (cons (concat "\\." (regexp-opt
                                  '("xsd" "sch" "rng" "xslt" "svg" "rss" "Rdb")
                                  t) "\\'") 'nxml-mode))

;; ========== Load ELPA ==========
(when (load (concat *emacs-root* "elpa/package.el"))
  (package-initialize))

;;=========== Load RDockbook ===========
(load "Rdocbook" t)

;; ========== YASnippet ==========
;; Not really a mode, but YASnippet is
;; kept under <emacs-root>/modes, so this is here
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat *emacs-root* "modes/yasnippet/snippets"))

;; ========== ido-mode ==========
;; only for 23 and above; issues occur otherwise
(when (>= emacs-major-version 23)
  (require 'tramp)
  (require 'ido)
  (ido-mode t)
  ;; enable fuzzy matching:
  (setq ido-enable-flex-matching t))

;; ========== js2-mode ==========
(require 'js2-mode)

;; ========== json.el ==========
(require 'json)

;; ========== python-mode ==========
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(setq py-indent-offset 4)

;; Check PEP8 Style on the fly 
;; relies on pep8.py
;; (when (load "flymake" t)
;;  (defun flymake-pylint-init ()
;;    (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                       'flymake-create-temp-inplace))
;;           (local-file (file-relative-name
;;                        temp-file
;;                        (file-name-directory buffer-file-name))))
;;          (list "/usr/local/bin/pep8.py" (list "--repeat" local-file))))

;;  (add-to-list 'flymake-allowed-file-name-masks
;;               '("\\.py\\'" flymake-pylint-init)))

;; ========== AUCTeX ==========
(setenv "PATH"
        (concat (getenv "PATH") (mapconcat #'(lambda (e) e) *tex-paths* ":")))
(setq exec-path (append exec-path *tex-paths*))

(load "auctex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)


;; ========== ESS Settings ==========
(require 'ess-site)
(setq ess-indent-level 2)
(setq ess-eval-visibly-p nil)

;; ========== Flyspell ==========
;; This is sometimes disabled as an Emacs 23 bug makes this slow with Sweave
(let ((aspell *aspell-path*))
  (if (file-exists-p aspell)
      (progn (setq ispell-dictionary "english")
             (setq ispell-program-name aspell)
             (add-hook 'LaTeX-mode-hook 'flyspell-mode)
             (global-set-key [mouse-3] 'flyspell-correct-word))
    (warn "aspell was not found in: %s" aspell)))

;; ========== Org-mode Settings ==========
(add-to-list 'load-path (concat *emacs-root* "modes/org-mode/lisp"))
(require 'org-install)
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-directory "~/org/")
(setq org-default-notes-file "~/org/.notes")
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(global-font-lock-mode t)

;; look for a basic template; if exists, insert it
(let ((basic-org-template (concat *emacs-root* "templates/basic.org")))
  (if (file-exists-p basic-org-template)
      (define-auto-insert "\.org" basic-org-template)))


;; binding remember-mode with org-mode
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)
(define-key global-map "\C-cr" 'org-remember)
(setq org-remember-templates
      '(("Todo" ?t "* TODO %^{Brief Description} %^g\n%?\nAdded: %U" "~/org/newgtd.org" "Tasks")))

;; Don't subscript
(setq org-export-with-sub-superscripts nil)

;; ========== Org Babel Mode Settings ==========
;; Active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (emacs-lisp . t)
   (sh . t)
   ))

;; Don't prompt for eval of each code block
(setq org-confirm-babel-evaluate nil)


;; ========== Slime, SBCL, and Clojure ==========
;; At the very least, I should have SBCL installed, otherwise skip.
(when *sbcl-path*
  (setq slime-lisp-implementations
        (list 
         '(sbcl (*sbcl-path*) :coding-system utf-8-unix)
         (if *clojure-path*
             `(clojure (,*clojure-path*) :init swank-clojure-init))))
  
  ;; Make slime more useful
  (require 'slime-autoloads)
  (add-hook 'lisp-mode-hook (lambda ()
                              (cond ((not (featurep 'slime))
                                     (require 'slime)
                                     (normal-mode)))))
  (eval-after-load "slime"
    '(progn
       (add-to-list 'load-path (concat *emacs-root* "modes/slime/contrib")
                    (require 'slime-fancy)
                    (require 'slime-banner)
                    (require 'slime-asdf)
                    (slime-banner-init)
                    (slime-asdf-init)
                    (setq slime-complete-symbol*-fancy t)
                    (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
                    (slime-setup))))
  (when *clojure-path*
    (setq auto-mode-alist
          (cons '("\\.clj$" . clojure-mode)
                auto-mode-alist))))