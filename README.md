**_DRAFT_**

dotfiles
========

_Mostly for darwin19 (macOS Catalina)._

This project contains files used for configuration of my boxes.  This is 
intended for use with macOS Catalina, but it should work with similar 
OSs. Files are either:

<!--

__nevermind about this stuff, finding a different solve__
* Prefs and settings (aka traditional dotfiles)
* Manifests for tooling/provisioning 
  - Toolchain-specific formats 
  - Super-simple text files can be scripted (or just used as a manual chcklist)

This branch represents some changes in both how and what I'm managing in 
dotfiles. The emphasis has shifted to user-specific configurations.  Scripted 
installation or provisioning has been moved to a separate repo.  The motivation
behind this is to allow for multiple identities/profiles to be layered into
configuration -- allowing for the duality or multiplicity of personal and
professional configuration profiles. 

For provisioning, see devbox repo.
-->

Evolutionary changes include:

* Configs for both `bash` and `zsh` shells
* Updated aliases and shortcuts
* Alignment to my latest (and greatest!) tools
* Moved to "plain old bash"

components
----------

Topical and conventional file naming is used to organize files, which are then
used by scripts to make it all happen.  

* folders collect topics
* file names are used for conventionla tasks
* file extensions are used to further identify the how or what should be used


__TODO review below__

* `bin` Anything in bin/ will get added to your $PATH and be made available everywhere.
* `topic` organizes with folders, filenames acting as a flag for install and bootstrapping scripts
    - *.zsh | *.bash: Files get loaded into your env
        - path.*: is loaded first and expected to setup $PATH or similar
        - completion.*: Loaded last as is expected to setup auto completion 
        - aliases.*:
        - functions.*: 
    - install.* : Files are executed or used by install scripts
        - brew-specific files 
        - install.sh executed when you run the script
        - install.formula | install.cask - brew-specific installation
    - postinstall.* : Files are executed or used by postinstall scritps

contents
--------

* _bash - dotfiles for bash shell_
* _brew - manifests for provisioning Homebrew_
  - formula
  - casks
* dirs - manifests for provisioning directories
* _mdown_
* _motd_
* _node_ 
* rust - manifests for provisioning Rust
* _tmux_
* _vim - dotfiles for neovim/vim_
* _zsh - dotfiles for zsh shell_

thanks
------

I had many years of use of dotfiles inspired by Ryan Bate.  I could have kept rolling with them just fine, but
the temptation to adopt a whole bunch of other (cool) rake/brew dotfile tools felt a bit to alluring.  So, I
opted to reduce the number of dependencies and roll my own.

This latest set is influenced by Zach Holman's dotfiles and indirectly by quite a few more.   
