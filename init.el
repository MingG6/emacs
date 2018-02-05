;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)
;;关闭菜单栏
(menu-bar-mode 0)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.





;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.



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

 ;; Find Executable Path on OS X
;; (when (memq window-system '(mac ns))
 ;;  (exec-path-from-shell-initialize)



;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode 1)

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq-default cursor-type 'bar)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 关闭缩进 (第二天中被去除)
;; (electric-indent-mode -1)

;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 160)

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

; 开启全局 Company 补全
(global-company-mode 1)

;;取消备份文件
(setq make-backup-files nil)

;;快捷打开最近编辑过的文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

(delete-selection-mode 1)

;; 这个快捷键绑定可以用之后的插件 counsel 代替
;; (global-set-key (kbd "C-x C-r") 'recentf-open-files)

;;org文档语法高亮
(require 'org)
(setq org-src-fontify-natively t)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(delete-selection-mode t)
;;开启全屏
;;(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;括号提示
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(add-hook 'C-mode-hook 'show-paren-mode)

;;显示当前行
(global-hl-line-mode t)

;;加载主题
;;(load-theme 'ample-light t t)
;;(load-theme 'ample-flat t t)
;;(load-theme 'ample t t)

;;(enable-theme 'ample)
(require 'apropospriate)
(load-theme 'apropospriate-dark t)

;;(load-theme 'atom-one-dark t)
;;(load-theme 'monokai t)

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company monokai-theme hungry-delete smex swiper counsel smartparens))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;设置字体
;;(set-default-font "YaHei Consolas Hybrid-14")

;;设置窗口
;;(set-frame-height (selected-frame)35)
;;(set-frame-width (selected-frame)145)
