; Require plugins
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/plugins/dirtree")
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme")
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")
(add-to-list 'load-path "~/.emacs.d/plugins/haskell-mode")
(add-to-list 'load-path "~/.emacs.d/plugins/erc")
(add-to-list 'load-path "~/.ghc-mod/share/ghc-mod-1.11.3")
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(add-to-list 'load-path "~/.emacs.d/plugins/ghc")
(add-to-list 'load-path "~/.emacs.d/plugins/gnus/lisp")
(add-to-list 'load-path "~/.emacs.d/plugins/magit")
(add-to-list 'load-path "~/.emacs.d/plugins/expand-region")
(add-to-list 'load-path "~/.emacs.d/plugins/mark-multiple")
(add-to-list 'load-path "~/.emacs.d/plugins/multiple-cursors")
(add-to-list 'load-path "~/.emacs.d/plugins/wrap-region")

(require 'color-theme)
(require 'redo+)
(require 'attic-lock)
(require 'dirtree)
(require 'textmate)
(require 'ido)
(require 'auto-complete)
(require 'misc)
(require 'org-install)
(require 'haskell-mode)
(require 'haskell-ghci)
(require 'erc)
(require 'yasnippet)
(require 'sr-speedbar)
(require 'window-numbering)
(require 'epa-file)
(require 'inf-haskell)
(require 'flymake)
(require 'org-install)
(require 'magit)
(require 'iy-go-to-char)
(require 'expand-region)
(require 'ace-jump-mode)
(require 'mark-multiple)
(require 'inline-string-rectangle)
(require 'mark-more-like-this)
(require 'multiple-cursors)
(require 'rainbow-delimiters)
(require 'wrap-region)
(require 'workgroups)
(require 'smex)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Modes
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(global-linum-mode 1)
(cua-mode t)
(global-auto-complete-mode 1)
(multiple-cursors-mode 1)
(color-theme-midnight)
(put 'downcase-region 'disabled nil)
(modify-frame-parameters nil '((wait-for-wm . nil)))
(global-rainbow-delimiters-mode)
(workgroups-mode 1)
(wrap-region-mode 1)
(electric-pair-mode 1)
(setq org-log-done t)
(epa-file-enable)
(window-numbering-mode 1)
(ido-mode 1)
(yas-global-mode 1)
(smex-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Custom functions

(defun load-haskell-workgroups ()
  (interactive)
  (setq b (current-buffer))
  (message "%s" b)
  (wg-load "~/.emacs.d/workgroups/Haskell")
  (switch-to-buffer b))

(defun ido-find-file-pane-3 ()
  "Open file in panel 3"
  (interactive)
  (select-window-3)
  (ido-find-file))

(defun delete-trailing-whitespace-and-save ()
  "Deletes trailing whitespace and saves"
  (interactive)
  (delete-trailing-whitespace)
  (save-buffer))

(defun save-and-lock2 () (interactive)
  (setq attic-lock-minor-mode t)
  (delete-trailing-whitespace)
  (save-buffer))

(defun zsh (buffer-name)
  "Start a terminal and rename buffer."
  (interactive "sbuffer name: ")
  (shell)
  (rename-buffer (format "%s%s" "$" buffer-name) t))

(defun get-current-buffer-major-mode ()
  (interactive)
  (message "%s" major-mode))

(defun hoogle-search (query)
  "Search with hoogle commandline"
  (interactive "sHoogle query: ")
  (if (get-buffer "*Hoogle*")
      (kill-buffer "*Hoogle*"))
  ; get the version of hoogle so I don't have to manually adjust it for each update
  (shell-command (format "version=`hoogle --version | head -n 1 | awk '{print $2}' | cut -c 2- | rev | cut -c 2- | rev`;
                          data=\"/databases\";
                          two=$version$data;
                          hoogle \"%s\" --data=$HOME/.lazyVault/sandboxes/hoogle/cabal/share/hoogle-$two" query))
  (switch-to-buffer "*Shell Command Output*")
  (rename-buffer "*Hoogle*")
  (haskell-mode)
  (linum-mode 0)
  (previous-buffer)
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(dirtree-windata (quote (frame left 0.15 delete)))
 '(haskell-indentation-layout-offset 4)
 '(haskell-indentation-left-offset 4)
 '(haskell-indentation-where-post-offset 4)
 '(haskell-mode-hook (quote (turn-on-haskell-indentation turn-on-font-lock turn-on-haskell-doc-mode auto-complete-mode wrap-region-mode imenu-add-menubar-index)))
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 587)
 '(speedbar-default-position (quote left))
 '(speedbar-show-unknown-files t)
 '(sr-speedbar-right-side nil)
 '(sr-speedbar-skip-other-window-p t)
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120)))
 '(vc-follow-symlinks t))


; Hooks
(add-hook 'inferior-haskell-mode-hook
          '(lambda() (set (make-local-variable 'linum-mode) nil)
                     (set (make-local-variable 'attic-minor-mode) nil)
                     (set (make-local-variable 'attic-lock-minor-mode) nil)))

(add-hook 'term-mode-hook
          '(lambda() (set (make-local-variable 'linum-mode) nil)
                     (set (make-local-variable 'attic-minor-mode) nil)
                     (set (make-local-variable 'attic-lock-minor-mode) nil)))
(add-hook 'speedbar-mode-hook
          '(lambda() (set (make-local-variable 'linum-mode) nil)
                     (set (make-local-variable 'attic-minor-mode) nil)
                     (set (make-local-variable 'attic-lock-minor-mode) nil)))
(add-hook 'shell-mode-hook
          '(lambda() (set (make-local-variable 'linum-mode) nil)
                     (set (make-local-variable 'attic-minor-mode) nil)
                     (set (make-local-variable 'attic-lock-minor-mode) nil)))
(add-hook 'magit-mode-hook
          '(lambda() (set (make-local-variable 'linum-mode) nil)
                     (set (make-local-variable 'attic-minor-mode) nil)
                     (set (make-local-variable 'attic-lock-minor-mode) nil)))
(add-hook 'shell-command-mode-hook
          '(lambda() (set (make-local-variable 'linum-mode) nil)
                     (set (make-local-variable 'attic-minor-mode) nil)
                     (set (make-local-variable 'attic-lock-minor-mode) nil)))
(add-hook 'lisp-interaction-mode-hook
          '(lambda() (set (make-local-variable 'linum-mode) nil)
                     (set (make-local-variable 'attic-minor-mode) nil)
                     (set (make-local-variable 'attic-lock-minor-mode) nil)))
(add-hook 'fundamental-mode-hook
          '(lambda() (set (make-local-variable 'linum-mode) nil)
                     (set (make-local-variable 'attic-minor-mode) nil)
                     (set (make-local-variable 'attic-lock-minor-mode) nil)))

(add-hook 'haskell-mode-hook 'turn-on-font-lock)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

(add-hook 'minibuffer-setup-hook 'attic-lock-minibuffer-setup-hook)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Settings
(setq cua-enable-cua-keys nil)
(setq-default indent-tabs-mode nil)
;; Don't create ~ files
(setq make-backup-files nil)
(setq org-agenda-files
      (list "~/org/notes.org"
            "~/org/todos.org"))

; Unset C-z
(dolist (key '("\C-z"))
  (global-unset-key key))

(ido-mode 'both) ;; for buffers and files
(setq
  ido-ignore-buffers
  '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace"
    "^\*compilation" "^\*GTAGS" "^session\.*" ".newsrc-dribble"
    "^\*scr" "^\*" "notes.org" "todos.org" "*.hi" "*.o")
  ido-case-fold  t				; be case-insensitive
  ido-enable-last-directory-history nil		; don't remember last used dirs
  ido-max-work-directory-list 30		; should be enough
  ido-max-work-file-list      50		; remember many
  ido-use-filename-at-point nil			; don't use filename at point (annoying)
  ido-use-url-at-point nil			; don't use url at point (annoying)
  ido-enable-flex-matching t			; try to be too smart
  ido-max-prospects 15				; don't spam my minibuffer
  ido-confirm-unique-completion t)		; wait for RET, even with unique completion
 (setq confirm-nonexistent-file-or-buffer nil)	; no confirmation
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Some custom colors
(set-face-foreground 'flymake-errline		"white"	)
(set-face-background 'flymake-errline		"red"	)
(set-face-background 'flymake-warnline		"yellow")
(set-face-foreground 'flymake-warnline		"white"	)
(set-face-foreground 'font-lock-string-face	"orange")
(set-face-background 'region			"blue"	)
(set-face-foreground 'region			"black"	)
(set-face-foreground 'isearch			"white"	)
(set-face-foreground 'linum			"gray"	)
(set-face-background 'linum			"black"	)
(set-face-foreground 'comint-highlight-prompt	"white"	)
(set-face-background 'magit-section-title	"black"	)
(set-face-background 'magit-branch		"black"	)
(set-face-foreground 'magit-section-title	"white"	)
(set-face-foreground 'magit-branch		"white"	)
(set-face-foreground 'mc/cursor-face		"white"	)
(set-face-background 'mc/cursor-face		"black"	)
(set-face-foreground 'magit-diff-file-header	"black"	)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; KEY BINDINGS

;; attic-lock

(define-key attic-lock-minor-mode-map (kbd "c f")	'textmate-goto-file)
(define-key attic-lock-minor-mode-map (kbd "x a a")	'ido-switch-buffer)
(define-key attic-lock-minor-mode-map (kbd "x a o")	'org-agenda)
(define-key attic-lock-minor-mode-map (kbd "x a c")	'org-cycle-agenda-files)
(define-key attic-lock-minor-mode-map (kbd "x a m")	'magit-status)
(define-key attic-lock-minor-mode-map (kbd "x f")	'ido-find-file)
(define-key attic-lock-minor-mode-map (kbd "x a w")	'load-haskell-workgroups)
(define-key attic-lock-minor-mode-map (kbd "q")		'backward-delete-char)
(define-key attic-lock-minor-mode-map (kbd "g")		'attic-rock-lock)
(define-key attic-lock-minor-mode-map (kbd "x s")       'save-and-lock)
(define-key attic-lock-minor-mode-map (kbd "c c")       'comment-or-uncomment-region)
(define-key attic-lock-minor-mode-map (kbd "c o")       'hoogle-search)


(defvar attic-minor-mode-map (make-keymap) "attic-minor-mode keymap.")

; Customs

; Control hotkeys
;(define-key attic-minor-mode-map (kbd "") 'keyboard-escape)
(define-key attic-minor-mode-map (kbd "C-c C-f")	'textmate-goto-file)
(define-key attic-minor-mode-map (kbd "C-x C-a C-a")	'ido-switch-buffer)
(define-key attic-minor-mode-map (kbd "C-x C-a C-o")	'org-agenda)
(define-key attic-minor-mode-map (kbd "C-x C-a C-c")	'org-cycle-agenda-files)
(define-key attic-minor-mode-map (kbd "C-x C-a <RET>")	'magit-status)
(define-key attic-minor-mode-map (kbd "C-M-s")		'iy-go-to-char-backward)
(define-key attic-minor-mode-map (kbd "C-x C-f")	'ido-find-file)
(define-key attic-minor-mode-map (kbd "C-x C-a C-w")	'load-haskell-workgroups)
(define-key attic-minor-mode-map (kbd "C-q")		'backward-delete-char)
(define-key attic-minor-mode-map (kbd "C-g")		'attic-rock-lock)
(define-key attic-minor-mode-map (kbd "C-x C-s")        'save-and-lock2)
(define-key attic-minor-mode-map (kbd "C-c C-c")	'comment-or-uncomment-region)
(define-key attic-minor-mode-map (kbd "C-c C-o")        'hoogle-search)
; Alt hotkeys

(define-key attic-minor-mode-map (kbd "M-#")           'cua-set-rectangle-mark)
(define-key attic-minor-mode-map (kbd "C-c C-f")       'textmate-goto-file)
(define-key attic-minor-mode-map (kbd "M-<RET>")       'find-tag)
(define-key attic-minor-mode-map (kbd "M-S")           'ace-jump-mode)
(define-key attic-minor-mode-map (kbd "M-s")           'iy-go-to-char)
(define-key attic-minor-mode-map (kbd "M-q")           'ace-jump-mode)
(define-key attic-minor-mode-map (kbd "M-x")       'execute-extended-command)
(define-key attic-minor-mode-map (kbd "M-+")	     'align-regexp)
(define-key attic-minor-mode-map (kbd "M-@")	     'er/expand-region)
(define-key attic-minor-mode-map (kbd "C-M-_")	     'redo)
(define-key attic-minor-mode-map (kbd "M-t")	     'transpose-words)
(define-key attic-minor-mode-map (kbd "M-T")	     'ghc-insert-template)
(define-key attic-minor-mode-map (kbd "M-E")	     'mc/edit-lines)
(define-key attic-minor-mode-map (kbd "M-x")	     'smex)
(define-key attic-minor-mode-map (kbd "M-X")	     'smex-major-mode-commands)



(global-set-key (kbd "M-P") 'mc/mark-previous-like-this)
(global-set-key (kbd "M-N") 'mc/mark-next-like-this)
(global-set-key (kbd "M-*") 'mc/mark-all-like-this)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Define mode
(define-minor-mode attic-minor-mode
"A minor mode so that my key settings override annoying major modes."

t " attic" 'attic-minor-mode-map)
(defun attic-minibuffer-setup-hook ()
	(attic-minor-mode 0))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Commands to start with
(sr-speedbar-window-dedicated-only-one-p)
;(zsh "term")
(sr-speedbar-open)
(sr-speedbar-close)
(wg-load "~/.emacs.d/workgroups/Haskell")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;haskell mode configuration
(setq auto-mode-alist
      (append auto-mode-alist
              '(("\\.[hg]s$"  . haskell-mode)
                ("\\.hic?$"   . haskell-mode)
                ("\\.hsc$"    . haskell-mode)
                ("\\.chs$"    . haskell-mode)
                ("\\.l[hg]s$" . literate-haskell-mode))))
(autoload 'haskell-mode "haskell-mode"
  "Major mode for editing Haskell scripts." t)
(autoload 'literate-haskell-mode "haskell-mode"
  "Major mode for editing literate Haskell scripts." t)

(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
