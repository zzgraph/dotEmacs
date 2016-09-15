#!/usr/bin/env bash

EMACS_CONFIGURATION_FOLDER=~/.emacs.d

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
j="emacs-theme-gruvbox";
if [ -e $EMACS_CONFIGURATION_FOLDER/elpa/$j ]; then
  echo "misc/$j exists, I will safely rename it to $j.bak and install new one";
  mv $EMACS_CONFIGURATION_FOLDER/elpa/$j $EMACS_CONFIGURATION_FOLDER/elpa/$j.bak;
fi
if [ -L $EMACS_CONFIGURATION_FOLDER/elpa/$j ]; then
       rm $EMACS_CONFIGURATION_FOLDER/elpa/$j;
       echo "misc/$j exists but it's a symlink";
       echo "OOPS! I removed symlink to your existing $j";
       echo "Excuse me :-( I betrayed your trust";
fi
ln -s $PWD/elpa/$j/ $EMACS_CONFIGURATION_FOLDER/elpa/$j;

