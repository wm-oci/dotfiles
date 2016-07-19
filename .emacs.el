(require 'package)

(setq package-list '(js2-mode solarized-theme markdown-mode magit spaceline flycheck))

(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

(require 'spaceline-config)
(spaceline-spacemacs-theme)

(load-file "~/.emacs.d/.javascript.el")

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; disable default \t
(setq-default indent-tabs-mode nil)
(ido-mode 1)

(load-theme 'solarized-dark t)

(add-hook 'after-init-hook #'global-flycheck-mode)

(global-set-key (kbd "C-|") 'magit-status)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(setq-default word-wrap t)

(custom-set-variables
 '(column-number-mode t)
 '(indicate-empty-lines t)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(js2-basic-offset 2)
 '(powerline-default-separator (quote wave))
 '(tool-bar-mode nil))
