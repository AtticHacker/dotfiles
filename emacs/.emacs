;; Require plugins
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/plugins/dirtree")
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme")
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")

(require 'color-theme)
(require 'bitlbee)
(require 'redo+)
(require 'dirtree)
(require 'textmate)
(require 'zenburn)
(require 'ido)
(require 'auto-complete)
(require 'misc)

;; SETTINGS

;;(setq c-basic-offset 2)
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

(defvar attic-minor-mode-map (make-keymap) "attic-minor-mode keymap.")
(define-key attic-minor-mode-map (kbd "C-i")        'backward-char)
(define-key attic-minor-mode-map (kbd "C-j")        'forward-char)
(define-key attic-minor-mode-map (kbd "M-j")        'forward-to-word)
(define-key attic-minor-mode-map (kbd "<tab>")      'indent-for-tab-command)
(define-key attic-minor-mode-map (kbd "M-i")        'backward-to-word)
(define-key attic-minor-mode-map (kbd "M-C-j")      'forward-to-word)
(define-key attic-minor-mode-map (kbd "M-C-i")      'backward-to-word)
(define-key attic-minor-mode-map (kbd "M-p")        'previous-line)
(define-key attic-minor-mode-map (kbd "M-n")        'next-line)
(define-key attic-minor-mode-map (kbd "M-C-p")      'previous-line)
(define-key attic-minor-mode-map (kbd "M-C-n")      'next-line)
(define-key attic-minor-mode-map (kbd "C-o")        'newline-down)
(define-key attic-minor-mode-map (kbd "M-o")        'newline-up)
(define-key attic-minor-mode-map (kbd "M-SPC")      'cua-set-rectangle-mark)
(define-key attic-minor-mode-map (kbd "C-d")        'kill-whole-line)
(define-key attic-minor-mode-map (kbd "C-<escape>") 'kill-buffer)
(define-key attic-minor-mode-map (kbd "M-1")        'indent-for-tab-command)
(define-key attic-minor-mode-map (kbd "M-`")        'switch-to-buffer)
(define-key attic-minor-mode-map (kbd "<f1>")       'split-window-vertically)
(define-key attic-minor-mode-map (kbd "<f2>")       'split-window-horizontally)
(define-key attic-minor-mode-map (kbd "<f3>")       'delete-window)
(define-key attic-minor-mode-map (kbd "C-<f1>")     'enlarge-window)
(define-key attic-minor-mode-map (kbd "C-<f2>")     'shrink-window)
(define-key attic-minor-mode-map (kbd "C-<f3>")     'enlarge-window-horizontally)
(define-key attic-minor-mode-map (kbd "C-<f4>")     'shrink-window-horizontally)
(define-key attic-minor-mode-map (kbd "M--")        'other-window)
(define-key attic-minor-mode-map (kbd "C--")        'undo)
(define-key attic-minor-mode-map (kbd "M--")        'redo)
(define-key attic-minor-mode-map (kbd "C-u")        'delete-backward-char)
(define-key attic-minor-mode-map (kbd "S-C-u")      'backward-delete-char)
(define-key attic-minor-mode-map (kbd "M-u")        'backward-kill-word)
(define-key attic-minor-mode-map (kbd "S-M-u")      'kill-word)
(define-key attic-minor-mode-map (kbd "M-]")        'indent-for-tab-command)
(define-key attic-minor-mode-map (kbd "C-q")        'find-file)
(define-key attic-minor-mode-map (kbd "M-q")        'textmate-goto-file)
(define-key attic-minor-mode-map (kbd "M-<RET>")    'execute-extended-command)

;; Unbind these fawkers for training
(define-key attic-minor-mode-map (kbd "C-f")        'keyboard-quit)
(define-key attic-minor-mode-map (kbd "C-b")        'keyboard-quit)
(define-key attic-minor-mode-map (kbd "M-f")        'keyboard-quit)
(define-key attic-minor-mode-map (kbd "M-b")        'keyboard-quit)
(define-key attic-minor-mode-map (kbd "C-M-f")      'keyboard-quit)
(define-key attic-minor-mode-map (kbd "C-M-b")      'keyboard-quit)


(define-minor-mode attic-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " attic" 'attic-minor-mode-map)

(defun attic-minibuffer-setup-hook ()
  (attic-minor-mode 0))

(add-hook 'minibuffer-setup-hook 'attic-minibuffer-setup-hook)

(attic-minor-mode 1)

;; ENABLE MODES AT STARTUP

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(global-linum-mode 1)
(color-theme-zenburn)
(cua-mode t)
(auto-fill-mode)
(global-auto-complete-mode t)
