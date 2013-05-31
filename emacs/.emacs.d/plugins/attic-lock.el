(defvar attic-lock-minor-mode-map (make-keymap) "attic-minor-mode keymap.")
(defvar attic-locker-minor-mode-map (make-keymap) "attic-minor-mode keymap.")

(defun save-and-lock () (interactive)
  (delete-trailing-whitespace)
  (save-buffer)
  (attic-rock-lock))

(defun attic-rock-lock () (interactive)
  (setq attic-lock-minor-mode t)
  (mc/keyboard-quit)
  (send-string-to-terminal "\033Ptmux;\033\033]12;White\007\033\\")
  (keyboard-escape-quit)
)
(defadvice keyboard-escape-quit (around my-keyboard-escape-quit activate)
  (let (orig-one-window-p)
    (fset 'orig-one-window-p (symbol-function 'one-window-p))
    (fset 'one-window-p (lambda (&optional nomini all-frames) t))
    (unwind-protect
        ad-do-it
      (fset 'one-window-p (symbol-function 'orig-one-window-p)))))

(define-key attic-locker-minor-mode-map (kbd "C-g")  'attic-rock-lock)
(define-key attic-locker-minor-mode-map (kbd "C-x C-s")  'save-and-lock)


(define-key attic-lock-minor-mode-map "1" 'digit-argument)
(define-key attic-lock-minor-mode-map "2" 'digit-argument)
(define-key attic-lock-minor-mode-map "3" 'digit-argument)
(define-key attic-lock-minor-mode-map "4" 'digit-argument)
(define-key attic-lock-minor-mode-map "5" 'digit-argument)
(define-key attic-lock-minor-mode-map "6" 'digit-argument)
(define-key attic-lock-minor-mode-map "7" 'digit-argument)
(define-key attic-lock-minor-mode-map "8" 'digit-argument)
(define-key attic-lock-minor-mode-map "9" 'digit-argument)

(define-key attic-lock-minor-mode-map (kbd "q")   (key-binding (kbd "\C-q")))
(define-key attic-lock-minor-mode-map (kbd "w")   (key-binding (kbd "\C-w")))
(define-key attic-lock-minor-mode-map (kbd "e")   (key-binding (kbd "\C-e")))
(define-key attic-lock-minor-mode-map (kbd "r")   (key-binding (kbd "\C-r")))
(define-key attic-lock-minor-mode-map (kbd "t")   (key-binding (kbd "\C-t")))
(define-key attic-lock-minor-mode-map (kbd "y")   (key-binding (kbd "\C-y")))
(define-key attic-lock-minor-mode-map (kbd "u")   (key-binding (kbd "\C-u")))
(define-key attic-lock-minor-mode-map (kbd "i")   'attic-lock-disable)
(define-key attic-lock-minor-mode-map (kbd "o")   (key-binding (kbd "\C-o")))
(define-key attic-lock-minor-mode-map (kbd "p")   (key-binding (kbd "\C-p")))
(define-key attic-lock-minor-mode-map (kbd "a")   (key-binding (kbd "\C-a")))
(define-key attic-lock-minor-mode-map (kbd "s")   (key-binding (kbd "\C-s")))
(define-key attic-lock-minor-mode-map (kbd "d")   (key-binding (kbd "\C-d")))
(define-key attic-lock-minor-mode-map (kbd "f")   (key-binding (kbd "\C-f")))
(define-key attic-lock-minor-mode-map (kbd "g")   (key-binding (kbd "\C-g")))
(define-key attic-lock-minor-mode-map (kbd "h")   (key-binding (kbd "\C-h")))
(define-key attic-lock-minor-mode-map (kbd "j")   (key-binding (kbd "\C-j")))
(define-key attic-lock-minor-mode-map (kbd "k")   (key-binding (kbd "\C-k")))
(define-key attic-lock-minor-mode-map (kbd "l")   (key-binding (kbd "\C-l")))
(define-key attic-lock-minor-mode-map (kbd "z")   'ido-switch-buffer)
(define-key attic-lock-minor-mode-map (kbd "v")   (key-binding (kbd "\C-v")))
(define-key attic-lock-minor-mode-map (kbd "b")   (key-binding (kbd "\C-b")))
(define-key attic-lock-minor-mode-map (kbd "n")   (key-binding (kbd "\C-n")))
(define-key attic-lock-minor-mode-map (kbd "m")   (key-binding (kbd "\C-m")))
(define-key attic-lock-minor-mode-map (kbd "<SPC>") 'set-mark-command)
(define-key attic-lock-minor-mode-map (kbd "[")   (key-binding (kbd "\C-[")))
(define-key attic-lock-minor-mode-map (kbd "]")   (key-binding (kbd "\C-]")))
(define-key attic-lock-minor-mode-map (kbd "_")   (key-binding (kbd "\C-_")))

(define-key attic-lock-minor-mode-map (kbd "Q")   (key-binding (kbd "\C-Q")))
(define-key attic-lock-minor-mode-map (kbd "W")   (key-binding (kbd "\C-W")))
(define-key attic-lock-minor-mode-map (kbd "E")   (key-binding (kbd "\C-E")))
(define-key attic-lock-minor-mode-map (kbd "R")   (key-binding (kbd "\C-R")))
(define-key attic-lock-minor-mode-map (kbd "T")   (key-binding (kbd "\C-T")))
(define-key attic-lock-minor-mode-map (kbd "Y")   (key-binding (kbd "\C-Y")))
(define-key attic-lock-minor-mode-map (kbd "U")   (key-binding (kbd "\C-U")))
(define-key attic-lock-minor-mode-map (kbd "I")   'attic-lock-disable)
(define-key attic-lock-minor-mode-map (kbd "O")   (key-binding (kbd "\C-O")))
(define-key attic-lock-minor-mode-map (kbd "P")   (key-binding (kbd "\C-P")))
(define-key attic-lock-minor-mode-map (kbd "A")   (key-binding (kbd "\C-A")))
(define-key attic-lock-minor-mode-map (kbd "S")   (key-binding (kbd "\C-S")))
(define-key attic-lock-minor-mode-map (kbd "D")   (key-binding (kbd "\C-D")))
(define-key attic-lock-minor-mode-map (kbd "F")   (key-binding (kbd "\C-F")))
(define-key attic-lock-minor-mode-map (kbd "G")   (key-binding (kbd "\C-G")))
(define-key attic-lock-minor-mode-map (kbd "H")   (key-binding (kbd "\C-H")))
(define-key attic-lock-minor-mode-map (kbd "J")   (key-binding (kbd "\C-J")))
(define-key attic-lock-minor-mode-map (kbd "K")   (key-binding (kbd "\C-K")))
(define-key attic-lock-minor-mode-map (kbd "L")   (key-binding (kbd "\C-L")))
(define-key attic-lock-minor-mode-map (kbd "Z")   'ido-switch-buffer)
(define-key attic-lock-minor-mode-map (kbd "V")   (key-binding (kbd "\C-V")))
(define-key attic-lock-minor-mode-map (kbd "B")   (key-binding (kbd "\C-B")))
(define-key attic-lock-minor-mode-map (kbd "N")   (key-binding (kbd "\C-N")))
(define-key attic-lock-minor-mode-map (kbd "M")   (key-binding (kbd "\C-M")))
(define-key attic-lock-minor-mode-map (kbd "[")   (key-binding (kbd "\C-[")))
(define-key attic-lock-minor-mode-map (kbd "]")   (key-binding (kbd "\C-]")))
(define-key attic-lock-minor-mode-map (kbd "_")   (key-binding (kbd "\C-_")))

(define-key attic-lock-minor-mode-map (kbd "x q") (key-binding (kbd "\C-x\C-q")))
(define-key attic-lock-minor-mode-map (kbd "x w") (key-binding (kbd "\C-x\C-w")))
(define-key attic-lock-minor-mode-map (kbd "x e") (key-binding (kbd "\C-x\C-e")))
(define-key attic-lock-minor-mode-map (kbd "x t") (key-binding (kbd "\C-x\C-t")))
(define-key attic-lock-minor-mode-map (kbd "x y") (key-binding (kbd "\C-x\C-y")))
(define-key attic-lock-minor-mode-map (kbd "x u") (key-binding (kbd "\C-x\C-u")))
(define-key attic-lock-minor-mode-map (kbd "x i") (key-binding (kbd "\C-x\C-i")))
(define-key attic-lock-minor-mode-map (kbd "x o") (key-binding (kbd "\C-x\C-o")))
(define-key attic-lock-minor-mode-map (kbd "x p") (key-binding (kbd "\C-x\C-p")))
(define-key attic-lock-minor-mode-map (kbd "x a") (key-binding (kbd "\C-x\C-a")))
(define-key attic-lock-minor-mode-map (kbd "x s") 'save-and-lock)
(define-key attic-lock-minor-mode-map (kbd "x d") (key-binding (kbd "\C-x\C-d")))
(define-key attic-lock-minor-mode-map (kbd "x f") (key-binding (kbd "\C-x\C-f")))
(define-key attic-lock-minor-mode-map (kbd "x g") (key-binding (kbd "\C-x\C-g")))
(define-key attic-lock-minor-mode-map (kbd "x h") (key-binding (kbd "\C-x\C-h")))
(define-key attic-lock-minor-mode-map (kbd "x j") (key-binding (kbd "\C-x\C-j")))
(define-key attic-lock-minor-mode-map (kbd "x k") (key-binding (kbd "\C-x\C-k")))
(define-key attic-lock-minor-mode-map (kbd "x l") (key-binding (kbd "\C-x\C-l")))
(define-key attic-lock-minor-mode-map (kbd "x z") (key-binding (kbd "\C-x\C-z")))
(define-key attic-lock-minor-mode-map (kbd "x x") (key-binding (kbd "\C-x\C-x")))
(define-key attic-lock-minor-mode-map (kbd "x c") (key-binding (kbd "\C-x\C-c")))
(define-key attic-lock-minor-mode-map (kbd "x v") (key-binding (kbd "\C-x\C-v")))
(define-key attic-lock-minor-mode-map (kbd "x b") (key-binding (kbd "\C-x\C-b")))
(define-key attic-lock-minor-mode-map (kbd "x n") (key-binding (kbd "\C-x\C-n")))
(define-key attic-lock-minor-mode-map (kbd "x m") (key-binding (kbd "\C-x\C-m")))

(define-key attic-lock-minor-mode-map (kbd "x Q") (key-binding (kbd "\C-x\C-Q")))
(define-key attic-lock-minor-mode-map (kbd "x W") (key-binding (kbd "\C-x\C-W")))
(define-key attic-lock-minor-mode-map (kbd "x E") (key-binding (kbd "\C-x\C-E")))
(define-key attic-lock-minor-mode-map (kbd "x T") (key-binding (kbd "\C-x\C-T")))
(define-key attic-lock-minor-mode-map (kbd "x Y") (key-binding (kbd "\C-x\C-Y")))
(define-key attic-lock-minor-mode-map (kbd "x U") (key-binding (kbd "\C-x\C-U")))
(define-key attic-lock-minor-mode-map (kbd "x I") (key-binding (kbd "\C-x\C-I")))
(define-key attic-lock-minor-mode-map (kbd "x O") (key-binding (kbd "\C-x\C-O")))
(define-key attic-lock-minor-mode-map (kbd "x P") (key-binding (kbd "\C-x\C-P")))
(define-key attic-lock-minor-mode-map (kbd "x A") (key-binding (kbd "\C-x\C-A")))
(define-key attic-lock-minor-mode-map (kbd "x S") 'save-and-lock)
(define-key attic-lock-minor-mode-map (kbd "x D") (key-binding (kbd "\C-x\C-D")))
(define-key attic-lock-minor-mode-map (kbd "x F") (key-binding (kbd "\C-x\C-F")))
(define-key attic-lock-minor-mode-map (kbd "x G") (key-binding (kbd "\C-x\C-G")))
(define-key attic-lock-minor-mode-map (kbd "x H") (key-binding (kbd "\C-x\C-H")))
(define-key attic-lock-minor-mode-map (kbd "x J") (key-binding (kbd "\C-x\C-J")))
(define-key attic-lock-minor-mode-map (kbd "x K") (key-binding (kbd "\C-x\C-K")))
(define-key attic-lock-minor-mode-map (kbd "x L") (key-binding (kbd "\C-x\C-L")))
(define-key attic-lock-minor-mode-map (kbd "x Z") (key-binding (kbd "\C-x\C-Z")))
(define-key attic-lock-minor-mode-map (kbd "x X") (key-binding (kbd "\C-x\C-X")))
(define-key attic-lock-minor-mode-map (kbd "x C") (key-binding (kbd "\C-x\C-C")))
(define-key attic-lock-minor-mode-map (kbd "x V") (key-binding (kbd "\C-x\C-V")))
(define-key attic-lock-minor-mode-map (kbd "x B") (key-binding (kbd "\C-x\C-B")))
(define-key attic-lock-minor-mode-map (kbd "x N") (key-binding (kbd "\C-x\C-N")))
(define-key attic-lock-minor-mode-map (kbd "x M") (key-binding (kbd "\C-x\C-M")))

(define-key attic-lock-minor-mode-map (kbd "x 1") (key-binding (kbd "\C-x 1")))
(define-key attic-lock-minor-mode-map (kbd "x 2") (key-binding (kbd "\C-x 2")))
(define-key attic-lock-minor-mode-map (kbd "x 3") (key-binding (kbd "\C-x 3")))
(define-key attic-lock-minor-mode-map (kbd "x 4") (key-binding (kbd "\C-x 4")))
(define-key attic-lock-minor-mode-map (kbd "x 5") (key-binding (kbd "\C-x 5")))
(define-key attic-lock-minor-mode-map (kbd "x 6") (key-binding (kbd "\C-x 6")))
(define-key attic-lock-minor-mode-map (kbd "x 7") (key-binding (kbd "\C-x 7")))
(define-key attic-lock-minor-mode-map (kbd "x 8") (key-binding (kbd "\C-x 8")))
(define-key attic-lock-minor-mode-map (kbd "x 9") (key-binding (kbd "\C-x 9")))

(define-key attic-lock-minor-mode-map (kbd "c q") (key-binding (kbd "\C-c\C-q")))
(define-key attic-lock-minor-mode-map (kbd "c w") (key-binding (kbd "\C-c\C-w")))
(define-key attic-lock-minor-mode-map (kbd "c e") (key-binding (kbd "\C-c\C-e")))
(define-key attic-lock-minor-mode-map (kbd "c r") (key-binding (kbd "\C-c\C-r")))
(define-key attic-lock-minor-mode-map (kbd "c t") (key-binding (kbd "\C-c\C-t")))
(define-key attic-lock-minor-mode-map (kbd "c y") (key-binding (kbd "\C-c\C-y")))
(define-key attic-lock-minor-mode-map (kbd "c u") (key-binding (kbd "\C-c\C-u")))
(define-key attic-lock-minor-mode-map (kbd "c i") (key-binding (kbd "\C-c\C-i")))
(define-key attic-lock-minor-mode-map (kbd "c o") (key-binding (kbd "\C-c\C-o")))
(define-key attic-lock-minor-mode-map (kbd "c p") (key-binding (kbd "\C-c\C-p")))
(define-key attic-lock-minor-mode-map (kbd "c a") (key-binding (kbd "\C-c\C-a")))
(define-key attic-lock-minor-mode-map (kbd "c s") (key-binding (kbd "\C-c\C-s")))
(define-key attic-lock-minor-mode-map (kbd "c d") (key-binding (kbd "\C-c\C-d")))
(define-key attic-lock-minor-mode-map (kbd "c f") (key-binding (kbd "\C-c\C-f")))
(define-key attic-lock-minor-mode-map (kbd "c g") (key-binding (kbd "\C-c\C-g")))
(define-key attic-lock-minor-mode-map (kbd "c h") (key-binding (kbd "\C-c\C-h")))
(define-key attic-lock-minor-mode-map (kbd "c j") (key-binding (kbd "\C-c\C-j")))
(define-key attic-lock-minor-mode-map (kbd "c k") (key-binding (kbd "\C-c\C-k")))
(define-key attic-lock-minor-mode-map (kbd "c l") (key-binding (kbd "\C-c\C-l")))
(define-key attic-lock-minor-mode-map (kbd "c z") (key-binding (kbd "\C-c\C-z")))
(define-key attic-lock-minor-mode-map (kbd "c x") (key-binding (kbd "\C-c\C-x")))
(define-key attic-lock-minor-mode-map (kbd "c c") (key-binding (kbd "\C-c\C-c")))
(define-key attic-lock-minor-mode-map (kbd "c v") (key-binding (kbd "\C-c\C-v")))
(define-key attic-lock-minor-mode-map (kbd "c b") (key-binding (kbd "\C-c\C-b")))
(define-key attic-lock-minor-mode-map (kbd "c n") (key-binding (kbd "\C-c\C-n")))
(define-key attic-lock-minor-mode-map (kbd "c m") (key-binding (kbd "\C-c\C-m")))

(define-key attic-lock-minor-mode-map (kbd "c Q") (key-binding (kbd "\C-c\C-Q")))
(define-key attic-lock-minor-mode-map (kbd "c W") (key-binding (kbd "\C-c\C-W")))
(define-key attic-lock-minor-mode-map (kbd "c E") (key-binding (kbd "\C-c\C-E")))
(define-key attic-lock-minor-mode-map (kbd "c R") (key-binding (kbd "\C-c\C-R")))
(define-key attic-lock-minor-mode-map (kbd "c T") (key-binding (kbd "\C-c\C-T")))
(define-key attic-lock-minor-mode-map (kbd "c Y") (key-binding (kbd "\C-c\C-Y")))
(define-key attic-lock-minor-mode-map (kbd "c U") (key-binding (kbd "\C-c\C-U")))
(define-key attic-lock-minor-mode-map (kbd "c I") (key-binding (kbd "\C-c\C-I")))
(define-key attic-lock-minor-mode-map (kbd "c O") (key-binding (kbd "\C-c\C-O")))
(define-key attic-lock-minor-mode-map (kbd "c P") (key-binding (kbd "\C-c\C-P")))
(define-key attic-lock-minor-mode-map (kbd "c A") (key-binding (kbd "\C-c\C-A")))
(define-key attic-lock-minor-mode-map (kbd "c S") (key-binding (kbd "\C-c\C-S")))
(define-key attic-lock-minor-mode-map (kbd "c D") (key-binding (kbd "\C-c\C-D")))
(define-key attic-lock-minor-mode-map (kbd "c F") (key-binding (kbd "\C-c\C-F")))
(define-key attic-lock-minor-mode-map (kbd "c G") (key-binding (kbd "\C-c\C-G")))
(define-key attic-lock-minor-mode-map (kbd "c H") (key-binding (kbd "\C-c\C-H")))
(define-key attic-lock-minor-mode-map (kbd "c J") (key-binding (kbd "\C-c\C-J")))
(define-key attic-lock-minor-mode-map (kbd "c K") (key-binding (kbd "\C-c\C-K")))
(define-key attic-lock-minor-mode-map (kbd "c L") (key-binding (kbd "\C-c\C-L")))
(define-key attic-lock-minor-mode-map (kbd "c Z") (key-binding (kbd "\C-c\C-Z")))
(define-key attic-lock-minor-mode-map (kbd "c X") (key-binding (kbd "\C-c\C-X")))
(define-key attic-lock-minor-mode-map (kbd "c C") (key-binding (kbd "\C-c\C-C")))
(define-key attic-lock-minor-mode-map (kbd "c V") (key-binding (kbd "\C-c\C-V")))
(define-key attic-lock-minor-mode-map (kbd "c B") (key-binding (kbd "\C-c\C-B")))
(define-key attic-lock-minor-mode-map (kbd "c N") (key-binding (kbd "\C-c\C-N")))
(define-key attic-lock-minor-mode-map (kbd "c M") (key-binding (kbd "\C-c\C-M")))

;(define-key attic-lock-minor-mode-map (kbd "x f") (key-binding (kbd "\C-x\C-f")))
(define-key attic-lock-minor-mode-map (kbd "-")   'undo)
;(define-key attic-lock-minor-mode-map (kbd ";")   "\C-;")
;(define-key attic-lock-minor-mode-map (kbd "\")   "\C-\\")
;(define-key attic-lock-minor-mode-map (kbd ",")   "\C-,")
;(define-key attic-lock-minor-mode-map (kbd ".")   "\C-.")
;(define-key attic-lock-minor-mode-map (kbd "/")   "\C-/")
;(define-key attic-lock-minor-mode-map (kbd "+")   "\C-+")
;(define-key attic-lock-minor-mode-map (kbd "=")   "\C-=")

(define-key attic-lock-minor-mode-map (kbd "x r C-@")     (key-binding (kbd "\C-xrC-@")))
(define-key attic-lock-minor-mode-map (kbd "x r <ESC>")   (key-binding (kbd "\C-xr ESC")))
(define-key attic-lock-minor-mode-map (kbd "x r <SPC>")   (key-binding (kbd "\C-xr SPC")))
(define-key attic-lock-minor-mode-map (kbd "x r +")       (key-binding (kbd "\C-xr+")))
(define-key attic-lock-minor-mode-map (kbd "x r N")       (key-binding (kbd "\C-xrN")))
(define-key attic-lock-minor-mode-map (kbd "x r b")       (key-binding (kbd "\C-xrb")))
(define-key attic-lock-minor-mode-map (kbd "x r c")       (key-binding (kbd "\C-xrc")))
(define-key attic-lock-minor-mode-map (kbd "x r d")       (key-binding (kbd "\C-xrd")))
(define-key attic-lock-minor-mode-map (kbd "x r f")       (key-binding (kbd "\C-xrf")))
(define-key attic-lock-minor-mode-map (kbd "x r g")       (key-binding (kbd "\C-xrg")))
(define-key attic-lock-minor-mode-map (kbd "x r i")       (key-binding (kbd "\C-xri")))
(define-key attic-lock-minor-mode-map (kbd "x r j")       (key-binding (kbd "\C-xrj")))
(define-key attic-lock-minor-mode-map (kbd "x r k")       (key-binding (kbd "\C-xrk")))
(define-key attic-lock-minor-mode-map (kbd "x r l")       (key-binding (kbd "\C-xrl")))
(define-key attic-lock-minor-mode-map (kbd "x r m")       (key-binding (kbd "\C-xrm")))
(define-key attic-lock-minor-mode-map (kbd "x r n")       (key-binding (kbd "\C-xrn")))
(define-key attic-lock-minor-mode-map (kbd "x r o")       (key-binding (kbd "\C-xro")))
(define-key attic-lock-minor-mode-map (kbd "x r r")       (key-binding (kbd "\C-xrr")))
(define-key attic-lock-minor-mode-map (kbd "x r s")       (key-binding (kbd "\C-xrs")))
(define-key attic-lock-minor-mode-map (kbd "x r t")       (key-binding (kbd "\C-xrt")))
(define-key attic-lock-minor-mode-map (kbd "x r w")       (key-binding (kbd "\C-xrw")))
(define-key attic-lock-minor-mode-map (kbd "x r x")       (key-binding (kbd "\C-xrx")))
(define-key attic-lock-minor-mode-map (kbd "x r y")       (key-binding (kbd "\C-xry")))
;(define-key attic-lock-minor-mode-map (kbd "x r C-<SPC>") (key-binding (kbd "\C-xr\C SPC")))
;(define-key attic-lock-minor-mode-map (kbd "x r M-w")     (key-binding (kbd "\C-xr\M-w")))

(define-key attic-lock-minor-mode-map (kbd "x k a")	(key-binding (kbd "\C-x\C-k\C-a")))
(define-key attic-lock-minor-mode-map (kbd "x k c")	(key-binding (kbd "\C-x\C-k\C-c")))
(define-key attic-lock-minor-mode-map (kbd "x k d")	(key-binding (kbd "\C-x\C-k\C-d")))
(define-key attic-lock-minor-mode-map (kbd "x k e")	(key-binding (kbd "\C-x\C-k\C-e")))
(define-key attic-lock-minor-mode-map (kbd "x k f")	(key-binding (kbd "\C-x\C-k\C-f")))
(define-key attic-lock-minor-mode-map (kbd "x k \t")	(key-binding (kbd "\C-x\C-k\t")))
(define-key attic-lock-minor-mode-map (kbd "x k k")	(key-binding (kbd "\C-x\C-k\C-k")))
(define-key attic-lock-minor-mode-map (kbd "x k l")	(key-binding (kbd "\C-x\C-k\C-l")))
(define-key attic-lock-minor-mode-map (kbd "x k <RET>") (key-binding (kbd "\C-x\C-k RET")))
(define-key attic-lock-minor-mode-map (kbd "x k n")	(key-binding (kbd "\C-x\C-k\C-n")))
(define-key attic-lock-minor-mode-map (kbd "x k p")	(key-binding (kbd "\C-x\C-k\C-p")))
(define-key attic-lock-minor-mode-map (kbd "x k s")	(key-binding (kbd "\C-x\C-k\C-s")))
(define-key attic-lock-minor-mode-map (kbd "x k t")	(key-binding (kbd "\C-x\C-k\C-t")))
(define-key attic-lock-minor-mode-map (kbd "x k v")	(key-binding (kbd "\C-x\C-k\C-v")))
(define-key attic-lock-minor-mode-map (kbd "x k SPC")	(key-binding(kbd "\C-x\C-k SPC")))
(define-key attic-lock-minor-mode-map (kbd "x k b")	(key-binding(kbd "\C-x\C-kb")))
(define-key attic-lock-minor-mode-map (kbd "x k e")	(key-binding(kbd "\C-x\C-ke")))
(define-key attic-lock-minor-mode-map (kbd "x k l")	(key-binding(kbd "\C-x\C-kl")))
(define-key attic-lock-minor-mode-map (kbd "x k n")	(key-binding(kbd "\C-x\C-kn")))
(define-key attic-lock-minor-mode-map (kbd "x k q")	(key-binding(kbd "\C-x\C-kq")))
(define-key attic-lock-minor-mode-map (kbd "x k r")	(key-binding(kbd "\C-x\C-kr")))
(define-key attic-lock-minor-mode-map (kbd "x k s")	(key-binding(kbd "\C-x\C-ks")))




(define-minor-mode attic-lock-minor-mode
"A minor mode so that my key settings override annoying major modes."

t " A-lock" 'attic-lock-minor-mode-map)
(defun attic-lock-minibuffer-setup-hook ()
	(attic-lock-minor-mode 0))

(define-minor-mode attic-locker-minor-mode
""

t "" 'attic-locker-minor-mode-map)
(defun attic-lock-minibuffer-setup-hook ()
	(attic-lock-minor-mode 0))

(defun attic-lock-disable () (interactive)
  (send-string-to-terminal "\033Ptmux;\033\033]12;Green\007\033\\")
  (setq attic-lock-minor-mode nil))

(defun attic-lock-enable () (interactive)
  (setq attic-lock-minor-mode t)
  (keyboard-escape-quit))

(provide 'attic-lock)
