;;;; org-settings.el -- org-mode settings

;; (setq org-directory "~/notebooks/")
;; (setq org-default-notes-file "~/org/.notes")
;; (define-key global-map "\C-cl" 'org-store-link)
;; (define-key global-map "\C-ca" 'org-agenda)
;; (org-agenda-files (quote ("~/notebooks/personal-todo.org")))
;; (global-font-lock-mode t)

;; ;; look for a basic template; if exists, insert it
;; (let ((basic-org-template (concat *emacs-root* "templates/basic.org")))
;;   (if (file-exists-p basic-org-template)
;;       (define-auto-insert "\.org" basic-org-template)))


;; binding remember-mode with org-mode
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)
(define-key global-map "\C-cr" 'org-remember)
(setq org-remember-templates
      '(("Todo" ?t "* TODO %^{Brief Description} %^g\n%?\nAdded: %U" "~/org/newgtd.org" "Tasks")))

;; Don't subscript
(setq org-export-with-sub-superscripts nil)

;; todoo states
(setq org-todo-keywords
      '((sequence "TODO(t)" "FEEDBACK(f)" "VERIFY(v)" 
                  "FRAGILE(f)" "|" "DONE(d)" "DELEGATED(g)")
        (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")))

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

;; ========= Org-mode Reference handling =========
(defun org-mode-reftex-setup ()
(load-library "reftex")
(and (buffer-file-name)
(file-exists-p (buffer-file-name))
(reftex-parse-all))
(define-key org-mode-map (kbd "C-c )") 'reftex-citation)
)
(add-hook 'org-mode-hook 'org-mode-reftex-setup)

(provide 'org-settings)
