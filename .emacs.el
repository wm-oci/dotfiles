;;; setup package list and package archie
(require 'package)
(setq package-list '(js2-mode solarized-theme markdown-mode web-mode magit spaceline flycheck exec-path-from-shell slime))
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; spaceline
(require 'spaceline-config)
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
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
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
