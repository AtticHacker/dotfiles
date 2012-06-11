;; Require plugins
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/plugins/eproject")
(add-to-list 'load-path "~/.emacs.d/plugins/icicles")
(add-to-list 'load-path "~/.emacs.d/plugins/find-file-in-project")
(add-to-list 'load-path "~/.emacs.d/plugins/dirtree")
(add-to-list 'load-path "~/.emacs.d/plugins/anything")
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme")

(require 'color-theme)
(require 'bitlbee)
(require 'eproject)
(require 'eproject-extras)
(require 'ido)
(require 'redo+)
(require 'dirtree)
(require 'textmate)
(require 'zenburn)
 
;; SETTINGS

;; Tab width
(setq c-basic-offset 2)

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

(global-set-key (kbd "M-`") 'eproject-ifind-file)
(global-set-key (kbd "C-`") 'eproject-ifind-file)

(global-set-key (kbd "<f1>") 'split-window-vertically)
(global-set-key (kbd "<f2>") 'split-window-horizontally)
(global-set-key (kbd "<f3>") 'delete-window)

(global-set-key (kbd "M--") 'other-window)

(global-set-key (kbd "C--") 'undo)
(global-set-key (kbd "C-x C-_") 'redo)
(global-set-key "\M-\d" 'comment-or-uncomment-region)

;; ENABLE MODES AT STARTUP

(tool-bar-mode)
(scroll-bar-mode)
(menu-bar-mode)
(global-linum-mode 1)
(color-theme-zenburn)
(cua-mode t)


;; EPROJECT CHANGES
;; eproject global bindings
(defmacro .emacs-curry (function &rest args)
  `(lambda () (interactive)
     (,function ,@args)))

;; eproject global bindings
(defmacro .emacs-curry (function &rest args)
  `(lambda () (interactive)
    (,function ,@args)))

(defmacro .emacs-eproject-key (key command)
  (cons 'progn
    (loop for (k . p) in (list (cons key 4) (cons (upcase key) 1))
      collect
        `(global-set-key
          (kbd ,(format "C-x p %s" k))
           (.emacs-curry ,command ,p)))))

(.emacs-eproject-key "k" eproject-kill-project-buffers)
(.emacs-eproject-key "v" eproject-revisit-project)
(.emacs-eproject-key "b" eproject-ibuffer)
(.emacs-eproject-key "o" eproject-open-all-project-files)
