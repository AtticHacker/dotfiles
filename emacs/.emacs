;; Require plugins
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/plugins/dirtree")
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme")

(require 'color-theme)
(require 'bitlbee)
(require 'redo+)
(require 'dirtree)
(require 'textmate)
(require 'zenburn)
(require 'ido)
 
;; SETTINGS

;; Tab width and use spaces
(setq c-basic-offset 2)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; Don't create ~ files
(setq make-backup-files nil)

;; Follows file links without asking
(custom-set-variables
 '(vc-follow-symlinks t))
(custom-set-faces
)

;; CUSTOM FUNCTIONS
(defun newline-up ()
  (interactive)
  (beginning-of-line)
  (newline)
  (previous-line)
)

(defun newline-down ()
  (interactive)
  (end-of-line)
  (newline)
)

;; KEY BINDINGS

(global-set-key (kbd "C-o") 'newline-down)
(global-set-key (kbd "M-o") 'newline-up)

(global-set-key (kbd "M-SPC") 'cua-set-rectangle-mark)
(global-set-key (kbd "C-d") 'kill-whole-line)

(global-set-key (kbd "M-`") 'textmate-goto-file)

(global-set-key (kbd "<f1>") 'split-window-vertically)
(global-set-key (kbd "<f2>") 'split-window-horizontally)
(global-set-key (kbd "<f3>") 'delete-window)
(global-set-key (kbd "C-<f1>") 'enlarge-window)
(global-set-key (kbd "C-<f2>") 'shrink-window)
(global-set-key (kbd "C-<f3>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-<f4>") 'shrink-window-horizontally)

(global-set-key (kbd "M--") 'other-window)

(global-set-key (kbd "C--") 'undo)
(global-set-key (kbd "S-C--") 'redo)
(global-set-key (kbd "C-x C-_") 'redo)
(global-set-key "\M-\d" 'comment-or-uncomment-region)


;; ENABLE MODES AT STARTUP

(tool-bar-mode)
(scroll-bar-mode)
(menu-bar-mode)
(global-linum-mode 1)
(color-theme-zenburn)
(cua-mode t)