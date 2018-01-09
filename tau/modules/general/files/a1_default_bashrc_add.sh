if ! [[ -f ~/.bashrc ]];then
 cp /etc/skel/.bashrc ~/.bashrc
fi

if ! [[ -f ~/.bash_profile ]];then
 cp /etc/skel/.bash_profile ~/.bash_profile
fi

