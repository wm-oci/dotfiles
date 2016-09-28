;; Colorful Markers
(setq fixme-modes '(emacs-lisp-mode js2-mode org-mode))
(make-face 'font-lock-fixme-face)
(make-face 'font-lock-study-face)
(make-face 'font-lock-important-face)
(make-face 'font-lock-question-face)
(make-face 'font-lock-note-face)
(make-face 'font-lock-see-face)
(mapc (lambda (mode)
        (font-lock-add-keywords
         mode
         '(("\\<\\(TODO\\)" 1 'font-lock-fixme-face t)
           ("\\<\\(STUDY\\)" 1 'font-lock-study-face t)
           ("\\<\\(IMPORTANT\\)" 1 'font-lock-important-face t)
           ("\\<\\(QUESTION\\)" 1 'font-lock-question-face t)
           ("\\<\\(SEE\\)" 1 'font-lock-see-face t)
           ("\\<\\(NOTE\\)" 1 'font-lock-note-face t)
           ("\\<\\(COMMENT\\)" 1 'font-lock-note-face t))))
      fixme-modes)
(modify-face 'font-lock-fixme-face "#D64C2A" nil nil t nil t nil nil)
(modify-face 'font-lock-study-face "Yellow" nil nil t nil t nil nil)
(modify-face 'font-lock-important-face "Yellow" nil nil t nil t nil nil)
(modify-face 'font-lock-question-face "#ffa500" nil nil t nil t nil nil)
(modify-face 'font-lock-see-face "#88C9F0" nil nil t nil t nil nil)
(modify-face 'font-lock-note-face "#8ABB93" nil nil t nil t nil nil)

(setq js2-basic-offset 2)
;; JSON files are opened with js-mode
(add-hook 'js-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

(provide '.javascript.el)
;;;
