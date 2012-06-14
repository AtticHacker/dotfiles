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
(require 'control-lock)

;; SETTINGS

;; Tab size
(setq-default tab-width 2)

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
  (control-lock-disable)
)

(defun newline-down ()
  (interactive)
  (end-of-line)
  (newline)
  (control-lock-disable)
)

(defun quit-and-lock ()
	(keyboard-quit)
	(control-lock-enable)
)
(defun delete-char-and-insert ()
	(interactive)
	(delete-char 1)
  (control-lock-disable)
)

(defun forward-char-and-insert ()
	(interactive)
	(forward-char 1)
  (control-lock-disable)
)


;; KEY BINDINGS

(defvar attic-minor-mode-map (make-keymap) "attic-minor-mode keymap.")

; Navigation
(define-key attic-minor-mode-map (kbd "C-k")        'backward-char)
(define-key attic-minor-mode-map (kbd "C-p")        'forward-char)
(define-key attic-minor-mode-map (kbd "C-o")        'previous-line)
(define-key attic-minor-mode-map (kbd "C-l")        'next-line)
(define-key attic-minor-mode-map (kbd "M-o")        'previous-line)
(define-key attic-minor-mode-map (kbd "M-l")        'next-line)
(define-key attic-minor-mode-map (kbd "M-p")        'forward-to-word)
(define-key attic-minor-mode-map (kbd "M-k")        'backward-word)
(define-key attic-minor-mode-map (kbd "M-C-p")      'forward-to-word)
(define-key attic-minor-mode-map (kbd "M-C-k")      'backward-word)
(define-key attic-minor-mode-map (kbd "M-C-o")      'previous-line)
(define-key attic-minor-mode-map (kbd "M-C-l")      'next-line)

; Advanced navigation
(define-key attic-minor-mode-map (kbd "C-j")        'newline-down)
(define-key attic-minor-mode-map (kbd "M-j")        'newline-up)
(define-key attic-minor-mode-map (kbd "C-M-j")      'newline-up)
(define-key attic-minor-mode-map (kbd "C-M-SPC")    'cua-set-rectangle-mark)
(define-key attic-minor-mode-map (kbd "C-d")        'kill-whole-line)
(define-key attic-minor-mode-map (kbd "M-`")        'textmate-goto-file)
(define-key attic-minor-mode-map (kbd "C-`")        'find-file)
(define-key attic-minor-mode-map (kbd "C-d")        'kill-whole-line)
(define-key attic-minor-mode-map (kbd "M-`")        'textmate-goto-file)
(define-key attic-minor-mode-map (kbd "C-`")        'find-file)
(define-key attic-minor-mode-map (kbd "C-b")        'switch-to-buffer)
(define-key attic-minor-mode-map (kbd "M-b")        'buffer-menu-other-window)
(define-key attic-minor-mode-map (kbd "C-M-b")      'buffer-menu-other-window)

; Window manipulation
(define-key attic-minor-mode-map (kbd "<f1>")       'split-window-vertically)
(define-key attic-minor-mode-map (kbd "<f2>")       'split-window-horizontally)
(define-key attic-minor-mode-map (kbd "<f3>")       'delete-window)
(define-key attic-minor-mode-map (kbd "C-<f1>")     'enlarge-window)
(define-key attic-minor-mode-map (kbd "C-<f2>")     'shrink-window)
(define-key attic-minor-mode-map (kbd "C-<f3>")     'enlarge-window-horizontally)
(define-key attic-minor-mode-map (kbd "C-<f4>")     'shrink-window-horizontally)
(define-key attic-minor-mode-map (kbd "C-<tab>")    'other-window)

; Control-mode-swapping
(define-key attic-minor-mode-map (kbd "M--")        'quit-and-lock)
(define-key attic-minor-mode-map (kbd "C-M--")        'quit-and-lock)
(define-key attic-minor-mode-map (kbd "C--")        'control-lock-disable)

; Editing
(define-key attic-minor-mode-map (kbd "C-u")        'undo)
(define-key attic-minor-mode-map (kbd "C-M-u")      'redo)
(define-key attic-minor-mode-map (kbd "M-u")        'redo)
(define-key attic-minor-mode-map (kbd "C-M-d")      'kill-word)
(define-key attic-minor-mode-map (kbd "C-,")        'delete-backward-char)
(define-key attic-minor-mode-map (kbd "C-M-,")      'delete-forward-char)
(define-key attic-minor-mode-map (kbd "M-,")        'delete-forward-char)
(define-key attic-minor-mode-map (kbd "C-q")        'yank)

; Custom
(define-key attic-minor-mode-map (kbd "M-<RET>")  'execute-extended-command)
(define-key attic-minor-mode-map (kbd "C-M-<RET>")  'execute-extended-command)

(define-minor-mode attic-minor-mode
	"A minor mode so that my key settings override annoying major modes."
  t " attic" 'attic-minor-mode-map)

(defun attic-minibuffer-setup-hook ()
  (attic-minor-mode 0))

(add-hook 'minibuffer-setup-hook 'attic-minibuffer-setup-hook)


;; ENABLE / DISABLE MODES AT STARTUP

(attic-minor-mode 1)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(global-linum-mode 1)
(color-theme-zenburn)
(cua-mode t)
(auto-fill-mode)
(global-auto-complete-mode t)
(control-lock-enable)
