;; save backup files in some tmp dir somewhere
(setq backup-directory-alist
    `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
    `((".*" ,temporary-file-directory t)))

; C-h as backspace
(global-set-key (kbd "C-h") 'delete-backward-char)
; C-M-h as word backspace (actually killing).  All of this jenkiness
; becuase emacs seems to think I have C pressed when I press M-H,
; though it still behaves differently when I *actually* have C
; pressed. Might be due to my current physical keyboard setup.
(global-unset-key (kbd "C-M-h"))
(global-unset-key (kbd "M-h"))
(global-set-key (kbd "M-h") 'backward-kill-word)
(global-set-key (kbd "C-M-h") 'backward-kill-word)
