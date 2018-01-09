#!/bin/bash

echo "#backing up gandalf2 to an external device on Legolas, keep a 2 day backups."

echo "#check if the backup drive is present and mounted or exit completely"

ssh root@legolas "mount /external_backup"

DRIVE=$(ssh root@legolas "df /external_backup |grep external_backup | cut -d' ' -f1")

#if [[ "$DRIVE" != "/dev/sd.*" ]];
if ! [[ $DRIVE =~ /dev/sd.* ]];
then
 echo "Gandalf2 backup disk not mounted on Legolas" |mail -s "Gandalf2 backup disk is not mounted on Legolas" odedhod@post.tau.ac.il
 exit 1
fi

echo "backing up"
echo "backup date :`date`"
#rsync -av --delete / /var /export root@legolas:/external_backup/gandalf2_backup/

rsync -hav --delete /bin/ root@legolas:/external_backup/gandalf2_backup/bin/
rsync -hav --delete /boot/ root@legolas:/external_backup/gandalf2_backup/boot/
rsync -hav --delete /dev/ root@legolas:/external_backup/gandalf2_backup/dev/
rsync -hav --delete /etc/ root@legolas:/external_backup/gandalf2_backup/etc/
rsync -hav --delete /export/ root@legolas:/external_backup/gandalf2_backup/export/
rsync -hav --delete /lib/ root@legolas:/external_backup/gandalf2_backup/lib/
rsync -hav --delete /lib64/ root@legolas:/external_backup/gandalf2_backup/lib64/
rsync -hav --delete /nsr/ root@legolas:/external_backup/gandalf2_backup/nsr/
rsync -hav --delete /opt/ root@legolas:/external_backup/gandalf2_backup/opt/
rsync -hav --delete /root/ root@legolas:/external_backup/gandalf2_backup/root/
rsync -hav --delete /sbin/ root@legolas:/external_backup/gandalf2_backup/sbin/
rsync -hav --delete /scratch/ root@legolas:/external_backup/gandalf2_backup/scratch/
rsync -hav --delete /tftpboot/ root@legolas:/external_backup/gandalf2_backup/tftpboot/
rsync -hav --delete /tmp/ root@legolas:/external_backup/gandalf2_backup/tmp/
rsync -hav --delete /usr/ root@legolas:/external_backup/gandalf2_backup/usr/
rsync -hav --delete /var/ root@legolas:/external_backup/gandalf2_backup/var/

sleep 2

#clean false positives
sed -i 's/.*mom_logs.*//g' /var/log/rsync_external;sed -i 's/.*\.log.*//g' /var/log/rsync_external
sed -i 's/.*discarded.*//g' /var/log/rsync_external
#notify of success or errors in rsync
grep -iq " failed\| error" /var/log/rsync_external && grep -v "\.log$" /var/log/rsync_external | grep -i " fail\| error" |mail -s "problem with gandalf2 backup" odedhod@post.tau.ac.il || echo "backup of Gandalf2 went OK " |mail -s "rsync log is fine." odedhod@post.tau.ac.il

