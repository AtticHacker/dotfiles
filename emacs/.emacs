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
;(require 'zenburn-theme)
(require 'yasnippet)
(require 'sr-speedbar)
(require 'window-numbering)
(require 'gnus-load)
(require 'epa-file)
(epa-file-enable)

;(color-theme-midnight 1)
(window-numbering-mode 1)
(ido-mode 1)
(yas-global-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(dirtree-windata (quote (frame left 0.15 delete)))
 '(haskell-mode-hook (quote (turn-on-haskell-indentation turn-on-font-lock turn-on-haskell-doc-mode auto-complete-mode imenu-add-menubar-index)))
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 587)
 '(speedbar-default-position (quote left))
 '(speedbar-show-unknown-files t)
 '(sr-speedbar-right-side nil)
 '(sr-speedbar-skip-other-window-p t)
 '(tab-stop-list (quote (2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50)))
 '(vc-follow-symlinks t))

;; SETTINGS


(add-hook 'haskell-ghci-mode-hook 
          '(lambda() 
             (set (make-local-variable 'linum-mode) nil)
             ))

(add-hook 'term-mode-hook 
          '(lambda() 
             (set (make-local-variable 'linum-mode) nil)
             ))

;; Tab size
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-tabs-mode nil)
(setq tab-width 4)
(setq cua-enable-cua-keys nil)
(customize-variable (quote tab-stop-list))

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

;; KEY BINDINGS
(defvar attic-minor-mode-map (make-keymap) "attic-minor-mode keymap.")


(define-key attic-minor-mode-map (kbd "M-C-SPC")    'cua-set-rectangle-mark)
(define-key attic-minor-mode-map (kbd "M-SPC")      'cua-set-rectangle-mark)
(define-key attic-minor-mode-map (kbd "C-c C-f")    'textmate-goto-file)

; For term
(define-key attic-minor-mode-map (kbd "C-x C-f")    'ido-find-file)
(define-key attic-minor-mode-map (kbd "C-x C-f")    'ido-find-file)

(define-key attic-minor-mode-map (kbd "C-`")        'find-file)
(define-key attic-minor-mode-map (kbd "M-`")        'textmate-goto-file)
(define-key attic-minor-mode-map (kbd "C-M-g")      'goto-line)

; Window manipulation
(define-key attic-minor-mode-map (kbd "C-c 1")   'select-window-1)
(define-key attic-minor-mode-map (kbd "C-c 2")   'select-window-2)
(define-key attic-minor-mode-map (kbd "C-c 3")   'select-window-3)
(define-key attic-minor-mode-map (kbd "C-c 4")   'select-window-4)
(define-key attic-minor-mode-map (kbd "C-c 5")   'select-window-5)
(define-key attic-minor-mode-map (kbd "C-c 6")   'select-window-6)
(define-key attic-minor-mode-map (kbd "C-c 7")   'select-window-7)
(define-key attic-minor-mode-map (kbd "C-c 8")   'select-window-8)
(define-key attic-minor-mode-map (kbd "C-c 9")   'select-window-9)
(define-key attic-minor-mode-map (kbd "C-c C-n")   'redraw-display)

; Editing

(define-key attic-minor-mode-map (kbd "M--")    'comment-or-uncomment-region)
(define-key attic-minor-mode-map (kbd "M-+")    'align-regexp)
(define-key attic-minor-mode-map (kbd "C-q")    'cua-paste)
(define-key attic-minor-mode-map (kbd "M-q")    'cua-paste-pop)

(defun zsh (buffer-name)
  "Start a terminal and rename buffer."  
  (interactive "sbuffer name: ")
  (term "/bin/zsh")
  (rename-buffer (format "%s%s" "$" buffer-name) t))

(ido-mode 'both) ;; for buffers and files
(setq 
  ;ido-save-directory-list-file "~/.emacs.d/cache/ido.last"

  ido-ignore-buffers ;; ignore these guys
  '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace"
    "^\*compilation" "^\*GTAGS" "^session\.*" "^\*" ".newsrc-dribble")
  ;ido-work-directory-list '("~/" "~/Desktop" "~/Documents" "~src")
  ido-case-fold  t                 ; be case-insensitive

  ido-enable-last-directory-history nil ; don't remember last used dirs
  ido-max-work-directory-list 30   ; should be enough
  ido-max-work-file-list      50   ; remember many
  ido-use-filename-at-point nil    ; don't use filename at point (annoying)
  ido-use-url-at-point nil         ; don't use url at point (annoying)

  ido-enable-flex-matching t       ; YES BE SMART HOLY SHIT! --don't try to be too smart
  ido-max-prospects 15              ; don't spam my minibuffer
  ido-confirm-unique-completion t) ; wait for RET, even with unique completion

;; when using ido, the confirmation is rather annoying...
 (setq confirm-nonexistent-file-or-buffer nil)

;; ENABLE / DISABLE MODES AT STARTUP

(define-minor-mode attic-minor-mode
"A minor mode so that my key settings override annoying major modes."

t " attic" 'attic-minor-mode-map)
(defun attic-minibuffer-setup-hook ()
	(attic-minor-mode 0))

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(global-linum-mode 1)
(cua-mode t)
(global-auto-complete-mode 1)
(color-theme-midnight)
(put 'downcase-region 'disabled nil)
(modify-frame-parameters nil '((wait-for-wm . nil)))
(set-face-background 'region "blue")
(set-face-foreground 'region "black")


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
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))
(put 'upcase-region 'disabled nil)
(require 'flymake)
(set-face-foreground 'flymake-errline "white")
(set-face-foreground 'flymake-warnline "white")
