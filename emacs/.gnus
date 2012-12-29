(setq gnus-select-method '(nnimap "gmail"
			  (nnimap-address "imap.gmail.com")
			  (nnimap-server-port 993)
			  (nnimap-stream ssl)
              (nnimap-authinfo-file "~/.authinfo.gpg")))
(setq gnus-use-dribble-file 1)
(defcustom auth-source-save-behavior 'ask
  "If set, auth-source will respect it for save behavior."
  :group 'auth-source
  :version "23.2" ;; No Gnus
  :type `(choice
          :tag "auth-source new token save behavior"
          (const :tag "Always save" t)
          (const :tag "Never save" nil)
		  (const :tag "Ask" ask)))
