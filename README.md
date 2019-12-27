dotfiles
========

_For darwin19 (macOS Catalina)._

This project contains files used for configuration of my boxes.  This is 
intended for use with macOS Catalina, but it should work with similar 
OS versions. Files are either:

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

Evolutionary changes include:

* Configs for both `bash` and `zsh` shells
* Updated aliases and shortcuts
* Alignment to my latest (and greatest!) tools

Contents
--------

* bash - dotfiles for bash shell
* brew - manifests for provisioning Homebrew
* dirs - manifests for provisioning directories
* mdown
* motd
* node 
* rust - manifests for provisioning Rust
* tmux
* vim - dotfiles for neovim/vim
* zsh - dotfiles for zsh shell




