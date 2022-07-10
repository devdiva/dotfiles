**_WORKING DRAFT_**

dotfiles
========

TL;DR
-------

_Mostly for darwin21 (macOS Monterey)._

This project contains files used for configuration and 
setup of my boxes.  This is intended for use with macOS 
Monterey, but it should work with similar OSs. 

This setup is geared towards app dev, data viz, fonts, 
graphics, multimedia and all the usual web stuffs using 
C#, Node, Python, Rust, R and a healthy dose of whatnot.

__Setup__

1. `mkdir ~/.my`
2. `cd ~/.my`
3. `git clone -b darwin21.5.0 https://github.com/devdiva/dotfiles.git`
4. `cd ~/.my/dotfiles`
5. _Optionally, review and adjust manifest files_
    - [My Workspace](./workspace/dirs.txt)
    - [My Brew Formulae](./brew/install.formula.txt) 
    - [Other Brew Formulae](./brew/postinstall.formula.txt)
    - [My Brew Casks](./brew/install.cask.txt)
    - [Other Brew Casks](./brew/postinstall.cask.txt)

__Install__

`cd ~/.my/dotfiles && install.sh`

__Uninstall__

`cd ~/.my/dotfiles && uninstall.sh`


Overview
--------

### Status

Evolutionary changes include:

* Configs for both `bash` and `zsh` shells
* Updated aliases and shortcuts
* Alignment to my latest (and greatest!) tools
* Moved to "plain old bash"

TODO:

* Workspace config
* Git config, ssh keys
* VS Code Plugins
* Adding uninstall / teardown

Considering:

* Utilities / scripts for
  - Activity logs, stats, analysis of time spent?
  - Backups
    - rsync
    - check for uncommitted files
  - Diffs (ala Kaleidescope)



### Goals

The overarching goals -- Keep my tools clean and 
sharp.  Spend more time doing and making.

> Whether for personal or professional use, my local 
> environment should be tuned for my use. The cognitive 
> load of switching to a new machine should be negligible. 

> I should be able to get up and running with a new local 
> environment in a minimal amount of time, _<1-2hrs_.


### Principles

* Favor simplicity
* Allow for flexibility and portability
* Allow for evolution and atomicity of updates
* Use convention over configuration
* Use standard tooling and package managers when appropriate
* Keep magic to a minimum
* Don't ignore the benefits of a given OS

### Conventions

A relatively simple set of conventions are followed:

* Top-level scripts are the entry-point for key actions:
  * `install.sh`
  * `uninstall.sh`
* Second-level or topical organization for tools
  * _Folder Names_ group configurations and commands
  * _File Names_ are used for conventional tasks
  * _File Extensions_ further describe how to execute or apply the task

_Folder Names_

Generally analogous to a specific tool or technology, topically 
named folders are grouped together 

_File Naming_

```abnf
<filename> ::= <base-name> ["." <sub-name>] "." <extension>
```

The following base names have specific meaning or conventional 
use in the top-level scripts.  

| name         | description                              |
|--------------|------------------------------------------|
| aliases      | Create aliases                           |
| completions  | Load completions                         |
| install      | Install stuff                            |
| unalias      | Remove aliases                           |
| uninstall    | Uninstall stuff                          |
| path         | Add path vars                            |
| _pre*_       | _Optional, things to do before_          |
| _post*_      | _Optional, things to do after_           |

A sub-name may be used to further describe topic-specific actions.  For 
example, they are used in the `brew` topic to manage `formula` and `cask`
actions distinctly.

Other files may be named as is convetional for that toolchain.  E.g. `init.vim`.

_Manifests_

When installing multiple dependencies, making directories or similar 
iterable actions, it makes sense to have a manifest file.  

To keep it dead-simple, these manifests are simple text files with a
light weight convention to prepend a signal for script processing.

* `?` An optional item, scripts should prompt user to choose
* `#` An ignorable item, scripts should skip

```txt
foo
?bar
#baz
```

<!-- __TODO review below__

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
    - postinstall.* : Files are executed or used by postinstall scritps -->

contents
--------

* brew - manifests for provisioning Homebrew and the dependencies it manages
  - formula
  - casks
* darwin - OS X specific install tuf
* dirs - manifests for provisioning directories
* _mdown_
* _motd_
* node 
* rust - manifests for provisioning Rust
* _tmux_
* vim - dotfiles for neovim/vim_
* wasm - _?Maybe wasm-pack should be in rust?_

thanks
------

I had many years of use of dotfiles inspired by Ryan Bates.  I could have kept rolling with them just fine, but
the temptation to adopt a whole bunch of other (cool) rake/brew dotfile tools felt a bit too alluring.  So, I
opted to reduce the number of dependencies and roll my own.

This latest set is influenced by Zach Holman's dotfiles and indirectly by quite a few more.   
