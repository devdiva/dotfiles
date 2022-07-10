#!/bin/sh
#
# Install dotfiles and apps
#
echo "Installing your apps and dotfiles"

# -- Constants
script_dir="$(dirname "$0")"

# TODO is this needed?
dotfiles_dir=~$HOME/.my/dotfiles

# -- Context Sanity Check

# TODO is this needed?

context_dir=$(pwd -P)

#if [[ $context_dir == $dotfiles_dir ]] ; then
#  echo "In the expected location"
#else
#  echo "Keep it tidy please. Execute from $dotfiles_dir"
#  exit
#fi

# -- Helper Methods
print_help()
{
  echo "Usage: install.sh"
}

# -- OS package manager
brew_install()
{
  if [[ $1 == 0 ]] ; then
    echo "No arguments supplied to brew install"
  else
   echo $1
   if [[ $1 =~ \.cask$  ]] ; then
     command_cask="cask"
     arg_cask="--cask"
   else
     command_cask=""
     arg_cask=""
   fi 
   echo "command_cask is $command_cask"
   while read -r -u 3 token; do
     if [[ ! -z "$token" ]] ; then
       case $token in
         [#]* )
	   #echo "skip $token"
           continue ;;
         [?]* )
           clean_token="${token//\?}"
           echo "clean token $clean_token"
           brew ls $arg_cask  --versions $clean_token > /dev/null
           if [[ $? == 0 ]] ; then
             echo " $clean_token already installed"	   
           else
             echo "token is not installed"
             read -p "$token  N/y " answer
             echo $answer
             while true ; do
               case $answer in
                 [yY]* )
                   echo "should insta $clean_token"
                   # this is failing silently
		   if [ -z $command_cask ]; then
		     brew install $clean_token
		   else
		     brew install $arg_cask --appdir="~/Applications" $clean_token
		   fi
                   break ;;
                 [nN]* )
                   break ;;
                 * )
                   echo "Please enter Y or N";
                   break ;;
               esac
             done
           fi
           ;;
         *)
           brew ls $arg_cask --versions $token > /dev/null
           if [[ $? == 0 ]] ; then
             echo "$token already installed"	   
           else
             brew install $token
           fi
           ;;
       esac
     fi
   done 3< $1
  fi  
}

bootstrap_brew()
{
  if [[ $OSTYPE == "darwin"* ]] ; then
    echo "Bootstrap Homebrew for OS X ($1)"
    if [[ -e "$script_dir/brew" ]] ; then
      case $1 in
        install) 
          # echo "should install"
          source "$script_dir/brew/install.sh"
          brew_install "$script_dir/brew/install.formula.txt"
          brew_install "$script_dir/brew/install.cask.txt"
          ;;
        postinstall)
          # echo "should postinstall"
          brew_install "$script_dir/brew/postinstall.formula.txt"
          brew_install "$script_dir/brew/postinstall.cask.txt"
          ;;
        *)
          echo "No argument supplied for bootsrapping brew"
          ;;
      esac
    fi
  fi
}

bootstrap_workspace()
{
  echo "bootstrap workspace"

  # make workspace directory
  workspace_dir="$HOME/workspace"
  mkdir -p "$workspace_dir"

  # make workspace subdirectories
  while read -r dir; do
    mkdir -p "$workspace_dir/$dir"
  done <"$script_dir/workspace/dirs.txt"
}

bootstrap_os()
{
  if [[ $OSTYPE == "darwin"* ]] ; then 
    echo "Bootstrap system for OS X ($1)"
    if [[ -e "$script_dir/darwin" ]]; then
      case $1 in
        install)
          source "$script_dir/darwin/install.sh"
          ;;
        postinstall)
          echo "should postinstall - noop"
          ;;
        *)
          echo "No argument supplied for bootstrapping os"
          ;;
      esac
    fi
  fi
}

bootstrap()
{
  echo "bootstrap" $1
  script_name="$1.sh"
  find ./**/* -name $script_name | while read installer ; do
    # TODO check if we have things that run twice.
    sh -c "${installer}"
  done
}


generate_shell_startup()
{
  echo "generate " $1
  my_file=$HOME/.my/$1
  echo $my_file
  touch $my_file
  echo '# generated file, do not edit\n' >  $my_file
  case $1 in
    [bash]*)
      find ./**/*.bash -type f -iname "path*" -or -iname "completion*" -or -iname "alias*"  | while read apath ; do
        cat $apath >> $my_file
      done
      ;;
    [zsh]*)
      find ./**/*.zsh -type f -iname "path*" -or -iname "completion*" -or -iname "alias*" | while read apath ; do
        cat $apath >> $my_file
      done
      ;;
    *)
      echo "unexpected shell startup file $1"
      ;;
  esac
  
}


bootstrap_shell_startup()
{
  echo "bootstrap " $1
  generate_shell_startup $1

  my_file=./my_$1
  my_dotfile=$HOME/.my/$1
  home_file=$HOME/.$1

  if [ ! -f $home_file ] ; then
    touch $home_file
  fi 
  
  grep $home_file -e $my_dotfile 
  if [[ $? == 0 ]] ; then
    echo "already sourced"
  else
    echo "\nsource $my_dotfile" >> $home_file
  fi
   
} 


# -- OS / system prefs
bootstrap_os install

# -- OS / workspace
bootstrap_workspace

# TODO bootstrap git,ssh configs

# -- INSTALL

bootstrap_brew install
bootstrap install

# -- POST-INSTALL
bootstrap_brew postinstall
bootstrap postinstall

# -- SHELL

bootstrap_shell_startup bashrc
bootstrap_shell_startup zshrc


