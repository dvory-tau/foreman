shell=`/bin/basename \`/bin/ps -p $$ -ocomm=\``
if [ -f /share/apps/modules/init/$shell ]
then
  . /share/apps/modules/init/$shell
else
  . /share/apps/modules/init/sh
fi
