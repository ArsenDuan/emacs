(global-linum-mode 1)

(setq cursor-type 'bar)

(setq inhibit-splash-screen 1)


(global-company-mode 1)

(electric-indent-mode -1)

(setq make-backup-files nil)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

(delete-selection-mode 1)
(setq initial-frame-alist '((fullscreen . maximized)))

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(global-hl-line-mode 1)


(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(provide 'init-better-defaults)

(windmove-default-keybindings)

(winner-mode t)
