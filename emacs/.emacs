; Require plugins
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/plugins/dirtree")
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme")
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")
(add-to-list 'load-path "~/.emacs.d/plugins/haskell-mode")
(add-to-list 'load-path "~/.ghc-mod/share/ghc-mod-1.11.3")
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(add-to-list 'load-path "~/.emacs.d/plugins/ghc")
(add-to-list 'load-path "~/.emacs.d/plugins/magit")
(add-to-list 'load-path "~/.emacs.d/plugins/expand-region")
(add-to-list 'load-path "~/.emacs.d/plugins/mark-multiple")
(add-to-list 'load-path "~/.emacs.d/plugins/multiple-cursors")
(add-to-list 'load-path "~/.emacs.d/plugins/wrap-region")
(add-to-list 'load-path "~/.emacs.d/plugins/elim/elisp")
(add-to-list 'load-path "/usr/lib/erlang/lib/tools-2.6.11/emacs")

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
(require 'epa-file)
(require 'gnus)
(require 'erlang-start)

(epa-file-enable)

(add-to-list 'load-path "/usr/pbi/emacs-i386/share/emacs/site-lisp/w3m")
(autoload 'w3m "w3m" "Interface for w3m on Emacs." t)
(require 'w3m-load)

;personal Config
(add-to-list 'load-path "~/.emacs.d/config")
(require 'my-keys)
(require 'my-functions)
(require 'my-hooks)
(require 'my-modes)
(require 'my-colors)
(require 'my-w3m)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load-library "garak")


(setq auto-mode-alist
      (cons '(".tpl" . html-mode)
      (cons '(".elm" . haskell-mode)
            auto-mode-alist)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(custom-safe-themes (quote ("dc3d6a554b626775e02c17da54e7b7f9378ccfd3cbadab62397f8a6ddf33490f" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "eecdec02a43c2dfdf388d7d27cb00af310b350d4ea6f923ebc82197d348cf383" default)))
 '(dirtree-windata (quote (frame left 0.15 delete)))
 '(haskell-indentation-layout-offset 4)
 '(haskell-indentation-left-offset 4)
 '(haskell-indentation-where-post-offset 4)
 '(haskell-mode-hook (quote (turn-on-haskell-indentation turn-on-font-lock turn-on-haskell-doc-mode auto-complete-mode wrap-region-mode imenu-add-menubar-index)))
 '(ido-separator "
           ")
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 587)
 '(speedbar-default-position (quote left))
 '(speedbar-show-unknown-files t)
 '(sr-speedbar-right-side nil)
 '(sr-speedbar-skip-other-window-p t)
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120)))
 '(vc-follow-symlinks t))


; Settings
(setq cua-enable-cua-keys nil)
(setq-default indent-tabs-mode nil)
;; Don't create ~ files
(setq make-backup-files nil)
(setq org-agenda-files
      (list "~/org/notes.org"
            "~/org/todos.org"
            "~/org/LazyCasts.org"
            ))

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

; Commands to start with
(sr-speedbar-window-dedicated-only-one-p)
(sr-speedbar-open)
(sr-speedbar-close)
(setenv (concat "GPG_AGENT_INFO" nil))

(when (file-executable-p "/usr/bin/gpg1") (setq epg-gpg-program "/usr/bin/gpg1"))


(wg-load "~/.emacs.d/workgroups/Haskell")
(setq wg-morph-on nil)

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
(put 'upcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-errline ((t (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow")))))
