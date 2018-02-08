;;修改tab缩进空格C/C++
(setq c-basic-offset 4)

;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;;关闭菜单栏
(menu-bar-mode 0)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode 1)

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq-default cursor-type 'bar)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;;更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 160)

;;取消备份文件
(setq make-backup-files nil)

;;显示当前行
(global-hl-line-mode t)

;;设置字体
;;(set-default-font "YaHei Consolas Hybrid-14")

;;设置窗口
;;(set-frame-height (selected-frame)35)
;;(set-frame-width (selected-frame)145)







(provide 'init-better-defaults)
