;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

;;快捷打开最近编辑过的文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 25)

(delete-selection-mode 1)

;;这个快捷键绑定可以用之后的插件 counsel 代替
(global-set-key (kbd "C-x C-r") 'recentf-open-files)






(provide 'init-keybindings)
