;; Require plugins
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/plugins/eproject")
(add-to-list 'load-path "~/.emacs.d/plugins/icicles")
(add-to-list 'load-path "~/.emacs.d/plugins/find-file-in-project")
(require 'bitlbee)
(require 'eproject)
(require 'eproject-extras)
(require 'ido)
(require 'icicles)
;; Enable line numbering
(global-linum-mode 1)

(icicle-mode)
;; Enable Ino mode
;;(ido-mode)

;; Tab width
(setq c-basic-offset 2)

;; Don't create ~ files
(setq make-backup-files nil)


;; Follows file links without asking
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(vc-follow-symlinks t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

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


