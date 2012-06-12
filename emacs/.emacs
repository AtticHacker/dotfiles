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
(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

(setq my-keys-minor-mode-map (delq '(kp-tab . [9]) my-keys-minor-mode-map))
(define-key my-keys-minor-mode-map (kbd "C-j") 'forward-char)
(define-key my-keys-minor-mode-map (kbd "C-i") 'backward-char)
(define-key my-keys-minor-mode-map (kbd "M-j") 'forward-word)
(define-key my-keys-minor-mode-map (kbd "M-i") 'backward-word)
(define-key my-keys-minor-mode-map (kbd "M-C-j") 'forward-word)
(define-key my-keys-minor-mode-map (kbd "M-C-i") 'backward-word)
(define-key my-keys-minor-mode-map (kbd "M-p") 'previous-line)
(define-key my-keys-minor-mode-map (kbd "M-n") 'next-line)
(define-key my-keys-minor-mode-map (kbd "M-C-p") 'previous-line)
(define-key my-keys-minor-mode-map (kbd "M-C-n") 'next-line)
(define-key my-keys-minor-mode-map (kbd "C-o") 'newline-down)
(define-key my-keys-minor-mode-map (kbd "S-C-o") 'newline-up)
(define-key my-keys-minor-mode-map (kbd "M-SPC") 'cua-set-rectangle-mark)
(define-key my-keys-minor-mode-map (kbd "C-d") 'kill-whole-line)
(define-key my-keys-minor-mode-map (kbd "C-<escape>") 'kill-buffer)
(define-key my-keys-minor-mode-map (kbd "M-`") 'textmate-goto-file)
(define-key my-keys-minor-mode-map (kbd "C-`") 'find-file)
(define-key my-keys-minor-mode-map (kbd "C-=") 'switch-to-buffer)
(define-key my-keys-minor-mode-map (kbd "<f1>") 'split-window-vertically)
(define-key my-keys-minor-mode-map (kbd "<f2>") 'split-window-horizontally)
(define-key my-keys-minor-mode-map (kbd "<f3>") 'delete-window)
(define-key my-keys-minor-mode-map (kbd "C-<f1>") 'enlarge-window)
(define-key my-keys-minor-mode-map (kbd "C-<f2>") 'shrink-window)
(define-key my-keys-minor-mode-map (kbd "C-<f3>") 'enlarge-window-horizontally)
(define-key my-keys-minor-mode-map (kbd "C-<f4>") 'shrink-window-horizontally)
(define-key my-keys-minor-mode-map (kbd "M--") 'other-window)
(define-key my-keys-minor-mode-map (kbd "C--") 'undo)
(define-key my-keys-minor-mode-map (kbd "S-C--") 'redo)
(define-key my-keys-minor-mode-map (kbd "C-x C-_") 'redo)
(define-key my-keys-minor-mode-map (kbd "C-u") 'delete-backward-char)
(define-key my-keys-minor-mode-map (kbd "S-C-u") 'backward-delete-char)
(define-key my-keys-minor-mode-map (kbd "M-u") 'backward-kill-word)
(define-key my-keys-minor-mode-map (kbd "S-M-u") 'kill-word)
;;(define-key my-keys-minor-mode-map "\M-\d" 'comment-or-uncomment-region)

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)

(defun my-minibuffer-setup-hook ()
  (my-keys-minor-mode 0))

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

(my-keys-minor-mode 1)

;; ENABLE MODES AT STARTUP

(tool-bar-mode)
(scroll-bar-mode)
(menu-bar-mode)
(global-linum-mode 1)
(color-theme-zenburn)
(cua-mode t)
(auto-fill-mode)
