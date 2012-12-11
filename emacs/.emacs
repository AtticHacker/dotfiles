; Require plugins
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/plugins/dirtree")
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme")
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")
(add-to-list 'load-path "~/.emacs.d/plugins/haskell-mode")
(add-to-list 'load-path "~/.emacs.d/plugins/erc")
(add-to-list 'load-path "~/.emacs-ghc-mod/.cabal/share/ghc-mod-1.11.2")
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(add-to-list 'load-path "~/.emacs.d/plugins/ghc")

(require 'color-theme)
(require 'redo+)
(require 'dirtree)
(require 'textmate)
(require 'ido)
(require 'auto-complete)
(require 'misc)
(require 'org-install)
(require 'haskell-mode)
(require 'haskell-ghci)
(require 'erc)
(require 'zenburn-theme)
(require 'yasnippet)
(yas-global-mode 1)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; SETTINGS


(global-set-key [tab] 'indent-or-expand)
(defun indent-or-expand ()
  "Either indent according to mode, or expand the word preceding point."
  (interactive)
  (if (or
       (eq last-command 'self-insert-command)
       (eq last-command 'dabbrev-expand))
      (progn
        (setq this-command 'dabbrev-expand)
        (dabbrev-expand nil))
    (indent-according-to-mode)))


;; Tab size
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(setq auto-mode-alist (cons '(".hs" . haskell-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("*terminal*" . (linum-mode 0)) auto-mode-alist))
(setq auto-mode-alist (cons '("*terminal*" . (attic-lock-mode 0)) auto-mode-alist))

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
 '(haskell-hoogle-command "")
 '(haskell-mode-hook (quote (turn-on-haskell-indentation turn-on-font-lock turn-on-haskell-doc-mode auto-complete-mode imenu-add-menubar-index)))
 '(tab-stop-list (quote (2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50)))

 '(vc-follow-symlinks t))

;; Don't create ~ files
(setq make-backup-files nil)

;; Follows file links without asking

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(mapc  
 (lambda (face)    
   (set-face-attribute face nil :weight 'bold))
 (face-list))

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
  ;(shell-command (format "echo -ne '\\033]12;green\\007' > /proc/%d/fd/1" (emacs-pid)))
  (send-string-to-terminal "\033]12;green\007")
  ;(send-string-to-terminal "echo -ne '\033]12;green\007'")
  ;(redraw-display)
)

(defun previous-line-two ()
  (interactive)
  (previous-line 2)
)

(defun next-line-two ()
  (interactive)
  (next-line 2)
)

(defun cmus-pause ()
  (interactive)
  (shell-command "cmus-remote -u")
)
(defun cmus-next ()
  (interactive)
  (shell-command "cmus-remote -n")
)
(defun cmus-prev ()
  (interactive)
  (shell-command "cmus-remote -r")
)
(defun cmus-vol-up ()
  (interactive)
  (shell-command "cmus-remote -v +5")
)
(defun cmus-vol-down ()
  (interactive)
  (shell-command "cmus-remote -v -5")
)

(defun attic-rock-lock () (interactive)
  (setq attic-lock-minor-mode t)
  ;(shell-command (format "echo -ne '\\033]12;white\\007' > /proc/%d/fd/1" (emacs-pid)))
  (send-string-to-terminal "\033]12;white\007")
  ;(send-string-to-terminal "echo -ne '\033]12;white\007'")
  ;(redraw-display)
  (keyboard-quit))


(defun attic-save () (interactive)
  (setq attic-lock-minor-mode t)
  ;(shell-command (format "echo -ne '\\033]12;white\\007' > /proc/%d/fd/1" (emacs-pid)))
  (send-string-to-terminal "\033]12;white\007")
  ;(send-string-to-terminal "echo -ne '\033]12;white\007'")
  ;(redraw-display)
  (save-buffer))


;; KEY BINDINGS

(defvar attic-minor-mode-map (make-keymap) "attic-minor-mode keymap.")
(defvar attic-lock-minor-mode-map (make-keymap) "attic-minor-mode keymap.")

; Navigation
;(define-key attic-minor-mode-map (kbd "C-f")        'forward-char)
;(define-key attic-minor-mode-map (kbd "C-b")        'backward-char)
;(define-key attic-minor-mode-map (kbd "C-p")        'previous-line)
;(define-key attic-minor-mode-map (kbd "C-n")        'next-line)

(define-key attic-lock-minor-mode-map (kbd "f")		'forward-char)
(define-key attic-lock-minor-mode-map (kbd "b")		'backward-char)
(define-key attic-lock-minor-mode-map (kbd "p")		'previous-line)
(define-key attic-lock-minor-mode-map (kbd "n")		'next-line)

(define-key attic-minor-mode-map (kbd "M-f")		'forward-to-word)
(define-key attic-minor-mode-map (kbd "M-b")		'backward-word)

(define-key attic-minor-mode-map (kbd "M-C-f")	    'forward-to-word)
(define-key attic-minor-mode-map (kbd "M-C-b")	    'backward-word-two)
(define-key attic-minor-mode-map (kbd "M-C-p")	    'previous-line-two)
(define-key attic-minor-mode-map (kbd "M-C-n")	    'next-line)
(define-key attic-lock-minor-mode-map (kbd "v")	    'cua-scroll-up)

; Advanced navigation
(define-key attic-minor-mode-map (kbd "C-o")        'newline-down)
(define-key attic-lock-minor-mode-map (kbd "o")     'newline-down)
(define-key attic-minor-mode-map (kbd "M-o")        'newline-up)
(define-key attic-minor-mode-map (kbd "C-M-o")      'newline-up)
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
;(define-key attic-minor-mode-map (kbd "C-e C-p")    'beginning-of-buffer)
;(define-key attic-minor-mode-map (kbd "C-e C-f")    'move-end-of-line)
;(define-key attic-minor-mode-map (kbd "C-e C-b")    'move-beginning-of-line)
;(define-key attic-minor-mode-map (kbd "C-e C-n")    'end-of-buffer)
;(define-key attic-lock-minor-mode-map (kbd "e p")   'beginning-of-buffer)
;(define-key attic-lock-minor-mode-map (kbd "e f")   'move-end-of-line)
;(define-key attic-lock-minor-mode-map (kbd "e b")   'move-beginning-of-line)
;(define-key attic-lock-minor-mode-map (kbd "e n")   'end-of-buffer)

(define-key attic-lock-minor-mode-map (kbd "e")     'move-end-of-line)
(define-key attic-lock-minor-mode-map (kbd "a")     'move-beginning-of-line)
(define-key attic-lock-minor-mode-map (kbd "s")     'isearch-forward)
(define-key attic-lock-minor-mode-map (kbd "r")     'isearch-backward)

; Window manipulation
(define-key attic-minor-mode-map (kbd "<f1>")       'split-window-vertically)
(define-key attic-minor-mode-map (kbd "<f2>")       'split-window-horizontally)
(define-key attic-minor-mode-map (kbd "<f3>")       'delete-window)
(define-key attic-lock-minor-mode-map (kbd "x o")   'other-window)
;(define-key attic-minor-mode-map (kbd "C-")     'enlarge-window)
;(define-key attic-minor-mode-map (kbd "C-]")     'shrink-window)
;(define-key attic-minor-mode-map (kbd "C-")     'enlarge-window-horizontally)
(define-key attic-lock-minor-mode-map (kbd "w")     'other-window)

; Control-mode-swapping
(define-key attic-lock-minor-mode-map (kbd "i")     'attic-lock-disable)
(define-key attic-minor-mode-map (kbd "C-g")        'attic-rock-lock)

; Editing
(define-key attic-lock-minor-mode-map (kbd "u")     'undo)
(define-key attic-minor-mode-map (kbd "C-u")        'undo)
(define-key attic-minor-mode-map (kbd "C-M-u")      'redo)
(define-key attic-minor-mode-map (kbd "M-u")        'redo)
(define-key attic-minor-mode-map (kbd "C-j")        'backward-delete-char)
(define-key attic-minor-mode-map (kbd "M-j")        'backward-kill-word)
(define-key attic-minor-mode-map (kbd "C-M-j")      'delete-forward-char)
(define-key attic-lock-minor-mode-map (kbd "j")     'delete-backward-char)
(define-key attic-minor-mode-map (kbd "C-y")        'copy-region-as-kill)
(define-key attic-minor-mode-map (kbd "C-q")        'yank)
(define-key attic-lock-minor-mode-map (kbd "y")     'copy-region-as-kill)
(define-key attic-lock-minor-mode-map (kbd "q")     'yank)
;(define-key attic-minor-mode-map (kbd "C-M-q")      'yank-pop)
(define-key attic-minor-mode-map (kbd "M-a")      'kmacro-start-macro)
(define-key attic-minor-mode-map (kbd "M-s")      'kmacro-end-macro)
(define-key attic-minor-mode-map (kbd "M-q")        'kmacro-end-and-call-macro)
(define-key attic-lock-minor-mode-map (kbd "z")		'delete-char-and-insert)
(define-key attic-minor-mode-map (kbd "C-z")        'delete-char-and-insert)
(define-key attic-lock-minor-mode-map (kbd "m")     'newline)
(define-key attic-minor-mode-map (kbd "M-m")        'newline)
(define-key attic-minor-mode-map (kbd "M--")        'comment-or-uncomment-region)
(define-key attic-minor-mode-map (kbd "C--")        'comment-or-uncomment-region)
(define-key attic-lock-minor-mode-map (kbd "-")     'comment-or-uncomment-region)
(define-key attic-minor-mode-map (kbd "M-=")        'align-regexp)
(define-key attic-minor-mode-map (kbd "C-x C-s")    'attic-save)
(define-key attic-lock-minor-mode-map (kbd "d")	    'delete-char)
(define-key attic-lock-minor-mode-map (kbd "c r")	'query-replace)
(define-key attic-lock-minor-mode-map (kbd "k")	    'kill-line)


; Custom
(define-key attic-minor-mode-map (kbd "M-m")        'execute-extended-command)
(define-key attic-minor-mode-map (kbd "C-M-<RET>")  'execute-extended-command)
(define-key attic-minor-mode-map (kbd "C-M-x")      'execute-extended-command)
(define-key attic-lock-minor-mode-map (kbd "x s")   'attic-save)
(define-key attic-lock-minor-mode-map (kbd "x c")   'save-buffers-kill-terminal)
(define-key attic-lock-minor-mode-map (kbd "M-\\")  'tmm-menubar)
(define-key attic-lock-minor-mode-map (kbd "C-c C-l")  'haskell-ghci-load-file)
(define-key attic-minor-mode-map (kbd "M-r")        'yas-expand)
(define-key attic-minor-mode-map (kbd "<ESC> <ESC>")'keyboard-escape-quit)

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
;(color-theme-ld-dark)
(cua-mode t)
(global-auto-complete-mode 1)
;(auto-complete-mode 1)

;wr
(put 'downcase-region 'disabled nil)
(modify-frame-parameters nil '((wait-for-wm . nil)))

;haskell mode configuration
(setq auto-mode-alist
      (append auto-mode-alist
              '(("\\.[hg]s$"  . haskell-mode)
                ("\\.hic?$"     . haskell-mode)
                ("\\.hsc$"     . haskell-mode)
                ("\\.chs$"    . haskell-mode)
                ("\\.l[hg]s$" . literate-haskell-mode))))
(autoload 'haskell-mode "haskell-mode"
  "Major mode for editing Haskell scripts." t)
(autoload 'literate-haskell-mode "haskell-mode"
  "Major mode for editing literate Haskell scripts." t)

;adding the following lines according to which modules you want to use:
(require 'inf-haskell)

(add-hook 'haskell-mode-hook 'turn-on-font-lock)
                                        ;(add-hook 'haskell-mode-hook 'turn-off-haskell-decl-scan)
                                        ;(add-hook 'haskell-mode-hook 'turn-off-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
                                        ;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
                                        ;(add-hook 'haskell-mode-hook 'turn-on-haskell-hugs)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-ghci)
;; (add-hook 'haskell-mode-hook
;;           (function
;;            (lambda ()
;;              (setq haskell-program-name "ghci")
;;              (setq haskell-ghci-program-name "ghci6"))))

(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))
