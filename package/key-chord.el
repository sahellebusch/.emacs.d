(use-package key-chord
  :init
  (progn
    (fset 'key-chord-define 'corgmonster/key-chord-define)
    (setq key-chord-one-key-delay 0.16)
    (key-chord-mode 1)
    (key-chord-define-global "kk" 'corgmonster/kill-whole-line-and-indent)
    (key-chord-define-global "oq" 'corgmonster/switch-to-previous-buffer)))

(defun corgmonster/switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(defun corgmonster/kill-whole-line-and-indent ()
  "Kills whole line and indents point according to current mode."
  (interactive)
  (kill-whole-line) (indent-according-to-mode))

(defun corgmonster/key-chord-define (keymap keys command)
  "Define in KEYMAP, a key-chord of two keys in KEYS starting a COMMAND.
\nKEYS can be a string or a vector of two elements. Currently only elements
that corresponds to ascii codes in the range 32 to 126 can be used.
\nCOMMAND can be an interactive function, a string, or nil.
If COMMAND is nil, the key-chord is removed.
MODIFICATION: Do not define the transposed key chord.
"
  (if (/= 2 (length keys))
      (error "Key-chord keys must have two elements"))
  ;; Exotic chars in a string are >255 but define-key wants 128..255 for those
  (let ((key1 (logand 255 (aref keys 0)))
        (key2 (logand 255 (aref keys 1))))
    (define-key keymap (vector 'key-chord key1 key2) command)))
