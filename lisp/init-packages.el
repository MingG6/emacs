(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
     )

 ;; cl - Common Lisp Extension
 (require 'cl)

 ;; Add Packages
 (defvar muyuqing/packages '(
		company
		monokai-theme
		hungry-delete
		smex
		swiper
		counsel
		smartparens
		apropospriate-theme
		atom-one-dark-theme
;;		google-c-style
		) "Default packages")

 (setq package-selected-packages muyuqing/packages)
 (defun muyuqing/packages-installed-p ()
     (loop for pkg in muyuqing/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

 (unless (muyuqing/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg muyuqing/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))



; 开启全局 Company 补全
(global-company-mode 1)

;;括号提示
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(add-hook 'C-mode-hook 'show-paren-mode)


;;加载hungry delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;;for semx
(require 'smex) ; Not needed if you use package.el
  (smex-initialize) ; Can be omitted. This might cause a (minimal) delay
;;(global-set-key (kbd "M-x") 'smex)

;;for swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

;;for smartparens
;;(require 'smartparens-config)
;;(smartparens-global-mode t)

;;加载google-c-stytle
(add-hook 'C-mode-common-hook 'google-set-c-stytle)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)



(provide 'init-packages)
