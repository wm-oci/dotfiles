;;; setup package list and package archie
(require 'package)
(setq package-list '(js2-mode solarized-theme markdown-mode web-mode magit spaceline flycheck exec-path-from-shell slime))
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; spaceline
(require 'spaceline-config)
(when (eq system-type 'darwin) ;fix for spaceline on mac
  (setf ns-use-srgb-colorspace nil))
(spaceline-spacemacs-theme)

;;; load javascript
(load-file "~/.emacs.d/.javascript.el")


;;; auto-install packages if missing
(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; init exec-path
(exec-path-from-shell-initialize)

;;; disable default \t
(setq-default indent-tabs-mode nil)
(ido-mode 1)

;;; solarized
(load-theme 'solarized-dark t)
(setq solarized-use-less-bold t)
(setq solarized-distinct-fringe-background t)

;;; start flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;;; keybindings
(global-set-key (kbd "C-|") 'magit-status)
(setq-default word-wrap t)

;;; custom vars
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(initial-buffer-choice "~/Dropbox/Org/panopticon.org")
 '(column-number-mode t)
 '(indicate-empty-lines t)
 '(js2-basic-offset 2)
 '(js2-mode-show-parse-errors nil)
 '(js2-strict-trailing-comma-warning nil)
 '(js2-strict-var-redeclaration-warning nil)
 '(powerline-default-separator (quote wave))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-error ((t nil)))
 '(js2-external-variable ((t nil)))
 '(js2-warning ((t nil))))

;;;org mode
(setq org-hide-emphasis-markers t)

;; Set your lisp system and, optionally, some contribs
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq slime-contribs '(slime-fancy))

;; disappear scroll bar
(scroll-bar-mode -1)

;; org mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;;; org mode tag customization
(setq org-todo-keyword-faces
      '(
        ("action" . (:foreground "yellow" :weight bold))
        ("IF-TIME" . (:foreground "yellow" :weight bold))
        ("TODO" . (:foreground "purple" :weight bold))
        ))

(setq org-todo-keywords
      '((sequence "TODO" "action" "IF-TIME" "DONE")))

(setq org-default-notes-file "~/org/notes.org")

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/tasks.org" "Tasks")
         "* TODO %?\n  %a\n  %i")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
         "* %?%^G\n  - Entered on %U\n  - Link: %a  \n  - Content:\n  %i")
        ("d" "Dev Note" entry (file+datetree "~/org/devnote.org")
         "* %?%^G\n  - Entered on %U\n  - Link: %a  \n  - Content:\n  %i")
        ("n" "Note" entry (file+datetree "~/org/notes.org")
         "* %?%^G\n  - Entered on %U\n  - Link: %a  \n  - Content:\n  %i")))

;; persist clocking across emacs sessions
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
