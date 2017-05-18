#!/usr/bin/env bash

EMACS_CONFIGURATION_FOLDER=$HOME/.emacs.d
SYSTEMD_USER_DIR=$HOME/.config/systemd/user
USER_DESKTOP_ENTRY_DIR=$HOME/.local/share/applications

if [ ! -d $SYSTEMD_USER_DIR ]; then
    mkdir -p $SYSTEMD_USER_DIR;
    echo "Making ~/.config/systemd/user/ directory"
fi

if [ -e $SYSTEMD_USER_DIR/emacs.service ]; then
    mv $SYSTEMD_USER_DIR/emacs.service $SYSTEMD_USER_DIR/emacs.service.bak;
fi

ln -s $PWD/emacs.service $SYSTEMD_USER_DIR/emacs.service;
echo "Creating systemd user unit file for emacs daemon";


if [ ! -d $USER_DESKTOP_ENTRY_DIR ]; then
    mkdir -p $USER_DESKTOP_ENTRY_DIR;
    echo "Making ~/.local/share/applications/ directory"
fi

if [ -e $USER_DESKTOP_ENTRY_DIR/emacsclient.desktop ]; then
    mv $USER_DESKTOP_ENTRY_DIR/emacsclient.desktop $USER_DESKTOP_ENTRY_DIR/emacsclient.desktop.bak;
fi

ln -s $PWD/emacsclient.desktop $USER_DESKTOP_ENTRY_DIR/emacsclient.desktop;
echo "Creating desktop entry file for Emacs Client";

if [ -e $HOME/.emacs ]; then
      echo "~/.emacs exists I'll safely rename it to init.el.bak and install new one";
    mv $HOME/.emacs $HOME/.emacs.bak;
fi

if [ ! -d $EMACS_CONFIGURATION_FOLDER ]; then
    mkdir $EMACS_CONFIGURATION_FOLDER;
    echo "Making Emacs Confoguration Folder: ~/.emacs.d";
else
    echo "Emacs Configuration Directory Already Exists, Good!"
fi

if [ -e $EMACS_CONFIGURATION_FOLDER/init.el ]; then
      echo "init.el exists I'll safely rename it to init.el.bak and install new one"
    mv $EMACS_CONFIGURATION_FOLDER/init.el $EMACS_CONFIGURATION_FOLDER/init.el.bak;
fi
if [ -h $EMACS_CONFIGURATION_FOLDER/init.el ]; then
         rm $EMACS_CONFIGURATION_FOLDER/init.el;
         echo "init.el exists but it's a symlink";
         echo "OOPS! I removed symlink to your existing init.el";
         echo "Excuse me :-( I betrayed your trust";
fi

ln -s $PWD/init.el $EMACS_CONFIGURATION_FOLDER/init.el;



if [ -e $EMACS_CONFIGURATION_FOLDER/personal ] && [ ! -L \
	      $EMACS_CONFIGURATION_FOLDER/personal ]  ; then
  echo "personal folder exists, I will safely rename it to personal.bak and install new one";
  mv $EMACS_CONFIGURATION_FOLDER/personal \
     $EMACS_CONFIGURATION_FOLDER/personal.bak;
fi

if [ -L $EMACS_CONFIGURATION_FOLDER/personal ]; then
         rm $EMACS_CONFIGURATION_FOLDER/personal;
         echo "init.el exists but it's a symlink";
         echo "OOPS! I removed symlink to your existing init.el";
         echo "Excuse me :-( I betrayed your trust";
fi


if [ ! -d $EMACS_CONFIGURATION_FOLDER/personal ]; then
    mkdir $EMACS_CONFIGURATION_FOLDER/personal;
fi


if [ ! -e $EMACS_CONFIGURATION_FOLDER/personal/custom.el ]; then
    touch $EMACS_CONFIGURATION_FOLDER/personal/custom.el;
fi


if [ ! -d $EMACS_CONFIGURATION_FOLDER/misc ]; then
    mkdir $EMACS_CONFIGURATION_FOLDER/misc;
fi


for i in $(ls ./misc/*.el)
    do 
         j=$(basename $i);
         if [ -e $EMACS_CONFIGURATION_FOLDER/misc/$j ]; then
              echo "misc/$j exists, I will safely rename it to $j.bak and install new one";
              mv $EMACS_CONFIGURATION_FOLDER/misc/$j $EMACS_CONFIGURATION_FOLDER/misc/$j.bak;
         fi
         if [ -L $EMACS_CONFIGURATION_FOLDER/misc/$j ]; then
                   rm $EMACS_CONFIGURATION_FOLDER/misc/$j;
                   echo "misc/$j exists but it's a symlink";
                   echo "OOPS! I removed symlink to your existing $j";
                   echo "Excuse me :-( I betrayed your trust";
         fi
         ln -s $PWD/$i $EMACS_CONFIGURATION_FOLDER/misc/$j;
done        
# j="emacs-theme-gruvbox";
# if [ -e $EMACS_CONFIGURATION_FOLDER/elpa/$j ] && [ ! -L \
# 	      $EMACS_CONFIGURATION_FOLDER/elpa/$j ]  ; then
#   echo "misc/$j exists, I will safely rename it to $j.bak and install new one";
#   mv $EMACS_CONFIGURATION_FOLDER/elpa/$j $EMACS_CONFIGURATION_FOLDER/elpa/$j.bak;
# fi
# if [ -L $EMACS_CONFIGURATION_FOLDER/elpa/$j ]; then
#        rm $EMACS_CONFIGURATION_FOLDER/elpa/$j;
#        echo "misc/$j exists but it's a symlink";
#        echo "OOPS! I removed symlink to your existing $j";
#        echo "Excuse me :-( I betrayed your trust";
# fi
# ln -s $PWD/elpa/$j $EMACS_CONFIGURATION_FOLDER/elpa/$j;

