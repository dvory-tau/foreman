class power5::add_sss_tamirs_grp{

$tamir_group_members="alexa9,coheneya1,renanaco,zurhadas2,zurhadas,zoharzaf,shimshi,giladshaham,guzeliez,dalon,liortrieman,kirilll1,n5,iddoweiner,oriahmio,doronlevin,tomerdiament"

	exec {'add_sss_tamirs_grp':

		unless => "grep 'tamirs:31895:${tamir_group_members}' /etc/group",
		       command => "sed -i 's/tamirs:31895.*//g' /etc/group; echo 'tamirs:31895:${tamir_group_members}' >> /etc/group",
		       path    => ["/usr/bin", "/usr/sbin","/bin"],

	}#exec

}#class
#file is updated daily by cron.daily puppet_p5_sssd_tamirs.sh
###tamirs_members(=)$(ldapsearch -x -LLL cn=tamirs memberUid |grep memberUid|awk '{print $2}'|paste -s -d ",")
####echo $tamirs_members
###grep "$tamirs_members" /etc/puppet/environments/developmentPower5/modules/power5/manifests/add_sss_tamirs_grp.pp||sed -i 's@tamir_group_members(=).*@tamir_group_members(=)\"'$tamirs_members'\"@g' /etc/puppet/environments/developmentPower5/modules/power5/manifests/add_sss_tamirs_grp.pp
###
