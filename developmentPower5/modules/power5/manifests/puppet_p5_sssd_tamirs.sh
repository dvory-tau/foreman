#!/bin/bash
tamirs_members=$(ldapsearch -x -LLL cn=tamirs memberUid |grep memberUid|awk '{print $2}'|paste -s -d ",")
#echo $tamirs_members
grep "$tamirs_members" /etc/puppet/environments/developmentPower5/modules/power5/manifests/add_sss_tamirs_grp.pp||sed -i 's@tamir_group_members=.*@tamir_group_members=\"'$tamirs_members'\"@g' /etc/puppet/environments/developmentPower5/modules/power5/manifests/add_sss_tamirs_grp.pp
