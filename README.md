# gelb-emacs-plugin
(very primitive) Support for the GeLB domain-specific language in Emacs

**[Warning/TODO] This plugin is still in the early stages...don't set your
hopes too high, please. And...contributions are welcome, from Emacs wizards!**

## Installing in Spacemacs

If you are a [GNU Emacs](http://www.gnu.org/software/emacs/?) user, you are
"missing out" if you are not also using the 
[spacemacs Emacs distribution](https://www.spacemacs.org/).

Unfortunately, the procedure for installing this "plugin" is still manual. Here
are the steps for installing it in Spacemacs:

1. Save the file `gelb-mode.el` somewhere in your home folder; note
   `your_chosen_directory`, because you will need it later.
2. open your `~/.spacemacs` file
3. inside the `dotspacemacs/user-config` function, add the following lines:
   ```elisp
   ;; add =gelb-mode.el= (for the GeLB DSL) to load-path
   (add-to-list 'load-path (expand-file-name "your_chosen_directory"))
   (load "gelb-mode")
   ```
   where you need to replace `your_chosen_directory` with what you chose at step
   (1) above
4. inside the `dotspacemacs/user-init` function, add the following lines:
   ```elisp
   ;; activate gelb-mode for files with the .gelb extension
   (setq auto-mode-alist (cons '("\\.gelb$" . gelb-mode) auto-mode-alist))
   ```
