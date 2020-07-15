#!/bin/sh
#
# Install dotfiles and apps
#
echo "Installing your apps and dotfiles"

# -- Constants
script_dir="$(dirname "$0")"

dotfiles_dir=~$HOME/.my/dotfiles

# -- Context Sanity Check

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

brew_install()
{
  if [[ $1 == 0 ]] ; then
    echo "No arguments supplied to brew install"
  else
   echo $1
   if [[ $1 =~ \.cask$  ]] ; then
     command_cask="cask"
   else
     command_cask=""
   fi 
   #echo "command_cask is $command_cask"
   while read -r -u 3 token; do
     if [[ ! -z "$token" ]] ; then
       case $token in
         [#]* )
           break ;;
         [?]* )
           clean_token="${token//\?}"
           echo "clean token $clean_token"
           brew $command_cask ls --versions $clean_token > /dev/null
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
		   brew $command_cask install --appdir="~/Applications" $clean_token
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
           brew $command_cask ls --versions $token > /dev/null
           if [[ $? == 0 ]] ; then
             echo "$token already installed"	   
           else
             brew $command_cask install $token
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
          source "$script_dir/brew/install.brew"
          brew_install "$script_dir/brew/install.formula"
          brew_install "$script_dir/brew/install.cask"
          ;;
        postinstall)
          echo "should postinstall"
          brew_install "$script_dir/brew/postinstall.formula"
          brew_install "$script_dir/brew/postinstall.cask"
          ;;
        *)
          echo "No argument supplied for bootsrapping brew"
          ;;
      esac
    fi
  fi
}

bootstrap()
{
  echo "boostrap" $1
  script_name="$1.sh"
  find ./**/* -name $script_name | while read installer ; do
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

# -- INSTALL

bootstrap_brew install
bootstrap install

# -- POST-INSTALL
bootstrap_brew postinstall
bootstrap postinstall

# -- SHELL

bootstrap_shell_startup bashrc
bootstrap_shell_startup zshrc

