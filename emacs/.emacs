;; Require plugins
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/plugins/dirtree")
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme")
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")
(add-to-list 'load-path "~/.emacs.d/plugins/haskell-mode")
(add-to-list 'load-path "~/.emacs.d/plugins/erc")

(require 'color-theme)
(require 'bitlbee)
(require 'redo+)
(require 'dirtree)
(require 'textmate)
(require 'zenburn)
(require 'color-theme-solarized)
(require 'ido)
(require 'auto-complete)
(require 'misc)
(require 'org-install)
(require 'haskell-mode)
(require 'erc)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
;; SETTINGS

;; Tab size
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; And I have tried
(setq indent-tabs-mode nil)
(setq tab-width 4)
(setq cua-enable-cua-keys nil)
(customize-variable (quote tab-stop-list))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(tab-stop-list (quote (2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50))))

;; Don't create ~ files
(setq make-backup-files nil)

;; Follows file links without asking
(custom-set-variables
  '(vc-follow-symlinks t))
(custom-set-faces
)


;; A few modes and such

(dolist (key '("\C-z"))
  (global-unset-key key))

;; CUSTOM FUNCTIONS

(defun newline-up ()
  (interactive)
  (beginning-of-line)
  (newline)
  (previous-line)
  (attic-lock-disable)
)

(defun newline-down ()
  (interactive)
  (end-of-line)
  (newline)
  (attic-lock-disable)
)

(defun delete-char-and-insert ()
	(interactive)
	(delete-char 1)
  (attic-lock-disable)
)

(defun forward-char-and-insert ()
	(interactive)
	(forward-char 1)
  (attic-lock-disable)
)

(defun kill-backward-line (arg)
	(interactive "p")
	(kill-line 0)
)

(defun attic-lock-enable () (interactive)
  (setq attic-lock-minor-mode t)
)

(defun attic-lock-disable () (interactive)
  (setq attic-lock-minor-mode nil)
)
;; KEY BINDINGS

(defvar attic-minor-mode-map (make-keymap) "attic-minor-mode keymap.")
(defvar attic-lock-minor-mode-map (make-keymap) "attic-minor-mode keymap.")

; Navigation
(define-key attic-minor-mode-map (kbd "C-k")        'backward-char)
(define-key attic-minor-mode-map (kbd "C-p")        'forward-char)
(define-key attic-minor-mode-map (kbd "C-o")        'previous-line)
(define-key attic-minor-mode-map (kbd "C-l")        'next-line)

(define-key attic-lock-minor-mode-map (kbd "k")		'backward-char)
(define-key attic-lock-minor-mode-map (kbd "p")		'forward-char)
(define-key attic-lock-minor-mode-map (kbd "o")		'previous-line)
(define-key attic-lock-minor-mode-map (kbd "l")		'next-line)

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
(define-key attic-lock-minor-mode-map (kbd "j")     'newline-down)
(define-key attic-minor-mode-map (kbd "M-j")        'newline-up)
(define-key attic-minor-mode-map (kbd "C-M-j")      'newline-up)
(define-key attic-lock-minor-mode-map (kbd "SPC")   'cua-set-mark)
(define-key attic-minor-mode-map (kbd "M-C-SPC")    'cua-set-rectangle-mark)
(define-key attic-minor-mode-map (kbd "M-SPC")      'cua-set-rectangle-mark)
(define-key attic-minor-mode-map (kbd "M-`")        'textmate-goto-file)
(define-key attic-minor-mode-map (kbd "C-M-`")      'textmate-goto-file)
(define-key attic-minor-mode-map (kbd "C-`")        'find-file)
(define-key attic-lock-minor-mode-map (kbd "`")     'find-file)
(define-key attic-minor-mode-map (kbd "C-h")        'switch-to-buffer)
(define-key attic-lock-minor-mode-map (kbd "h")     'switch-to-buffer)
(define-key attic-minor-mode-map (kbd "M-h")        'buffer-menu-other-window)
(define-key attic-minor-mode-map (kbd "C-M-h")      'buffer-menu-other-window)
(define-key attic-minor-mode-map (kbd "C-M-g")      'goto-line)
(define-key attic-lock-minor-mode-map (kbd "g")     'goto-line)
(define-key attic-minor-mode-map (kbd "C-e C-o")    'beginning-of-buffer)
(define-key attic-minor-mode-map (kbd "C-e C-p")    'move-end-of-line)
(define-key attic-minor-mode-map (kbd "C-e C-k")    'move-beginning-of-line)
(define-key attic-minor-mode-map (kbd "C-e C-l")    'end-of-buffer)
(define-key attic-lock-minor-mode-map (kbd "e o")   'beginning-of-buffer)
(define-key attic-lock-minor-mode-map (kbd "e p")   'move-end-of-line)
(define-key attic-lock-minor-mode-map (kbd "e k")   'move-beginning-of-line)
(define-key attic-lock-minor-mode-map (kbd "e l")   'end-of-buffer)
(define-key attic-minor-mode-map (kbd "C-z")        'isearch-forward)
(define-key attic-lock-minor-mode-map (kbd "z")     'isearch-forward)

; Window manipulation
(define-key attic-minor-mode-map (kbd "<f1>")       'split-window-vertically)
(define-key attic-minor-mode-map (kbd "<f2>")       'split-window-horizontally)
(define-key attic-minor-mode-map (kbd "<f3>")       'delete-window)
(define-key attic-minor-mode-map (kbd "C-<f1>")     'enlarge-window)
(define-key attic-minor-mode-map (kbd "C-<f2>")     'shrink-window)
(define-key attic-minor-mode-map (kbd "C-<f3>")     'enlarge-window-horizontally)
(define-key attic-minor-mode-map (kbd "C-<f4>")     'shrink-window-horizontally)
(define-key attic-lock-minor-mode-map (kbd "<tab>") 'other-window)
(define-key attic-lock-minor-mode-map (kbd "C-<tab>") 'other-window)

; Control-mode-swapping
(define-key attic-minor-mode-map (kbd "M-[")        'attic-lock-enable)
(define-key attic-minor-mode-map (kbd "C-M-[")      'attic-lock-enable)
(define-key attic-lock-minor-mode-map (kbd "[")     'attic-lock-disable)

; Editing
(define-key attic-lock-minor-mode-map (kbd "u")     'undo)
(define-key attic-minor-mode-map (kbd "C-u")        'undo)
(define-key attic-minor-mode-map (kbd "C-M-u")      'redo)
(define-key attic-minor-mode-map (kbd "M-u")        'redo)
(define-key attic-minor-mode-map (kbd "C-,")        'delete-backward-char)
(define-key attic-minor-mode-map (kbd "C-M-,")      'delete-forward-char)
(define-key attic-lock-minor-mode-map (kbd ",")     'delete-backward-char)
(define-key attic-minor-mode-map (kbd "M-,")        'delete-forward-char)
(define-key attic-minor-mode-map (kbd "C-y")        'copy-region-as-kill)
(define-key attic-minor-mode-map (kbd "C-q")        'yank)
(define-key attic-lock-minor-mode-map (kbd "y")     'copy-region-as-kill)
(define-key attic-lock-minor-mode-map (kbd "q")     'yank)
(define-key attic-minor-mode-map (kbd "C-M-q")      'yank-pop)
(define-key attic-minor-mode-map (kbd "M-q")        'yank-pop)
(define-key attic-minor-mode-map (kbd "C-s")        'delete-char-and-insert)
(define-key attic-minor-mode-map (kbd "C-a")        'forward-char-and-insert)
(define-key attic-minor-mode-map (kbd "C-d C-d")    'kill-whole-line)
(define-key attic-minor-mode-map (kbd "C-d C-e C-p")'kill-line)
(define-key attic-minor-mode-map (kbd "C-d C-e C-k")'kill-backward-line)
(define-key attic-minor-mode-map (kbd "C-d C-p")    'kill-word)
(define-key attic-minor-mode-map (kbd "C-d C-k")    'backward-kill-word)
(define-key attic-minor-mode-map (kbd "C-c C-r")    'query-replace)

;(define-key attic-lock-minor-mode-map (kbd "w")		  'cua-cut-region)
(define-key attic-lock-minor-mode-map (kbd "s")		  'delete-char-and-insert)
(define-key attic-lock-minor-mode-map (kbd "a")		  'forward-char-and-insert)
(define-key attic-lock-minor-mode-map (kbd "d d")	  'kill-whole-line)
(define-key attic-lock-minor-mode-map (kbd "d e p")   'kill-line)
(define-key attic-lock-minor-mode-map (kbd "d e k")   'kill-backward-line)
(define-key attic-lock-minor-mode-map (kbd "d p")	  'kill-word)
(define-key attic-lock-minor-mode-map (kbd "d k")	  'backward-kill-word)
(define-key attic-lock-minor-mode-map (kbd "c r")	  'query-replace)

; Custom
(define-key attic-minor-mode-map (kbd "M-<RET>")    'execute-extended-command)
(define-key attic-minor-mode-map (kbd "C-M-<RET>")  'execute-extended-command)
(define-key attic-minor-mode-map (kbd "C-M-x")      'execute-extended-command)
(define-key attic-minor-mode-map (kbd "M-x")        'execute-extended-command)
(define-key attic-lock-minor-mode-map (kbd "x s")   'save-buffer)
(define-key attic-lock-minor-mode-map (kbd "x c")   'save-buffers-kill-terminal)

;; ENABLE / DISABLE MODES AT STARTUP

(define-minor-mode attic-minor-mode
"A minor mode so that my key settings override annoying major modes."

t " attic" 'attic-minor-mode-map)
(defun attic-minibuffer-setup-hook ()
	(attic-minor-mode 0))

(define-minor-mode attic-lock-minor-mode
"A minor mode so that my key settings override annoying major modes."

t " attic-lock" 'attic-lock-minor-mode-map)
(defun attic-lock-minibuffer-setup-hook ()
	(attic-lock-minor-mode 0))

;(add-hook 'minibuffer-setup-hook 'attic-minibuffer-setup-hook)
(add-hook 'minibuffer-setup-hook 'attic-lock-minibuffer-setup-hook)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(global-linum-mode 1)
(color-theme-solarized-dark)
(cua-mode t)
(global-auto-complete-mode t)

;wrtlvm
