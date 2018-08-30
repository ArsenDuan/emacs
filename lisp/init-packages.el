(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			         ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

(require 'cl)

(defvar my/packages '(
		      ;;
		      smex
		      ;; --- auto-completion ---
		      company
		      ;; --- better-editor ---
		      hungry-delete
		      swiper
		      counsel
		      smartparens
		      ;; --- major mode ---
		      js2-mode
		      ;; --- minor mode ---
		      nodejs-repl
		      exec-path-from-shell
		      ;; --- themes ---
		      monokai-theme
		      ;; solarized-theme
		      ) "Default packages")
(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(global-hungry-delete-mode 1)

(require 'smex)
(smex-initialize)

(smartparens-global-mode t)

(provide 'init-packages)
