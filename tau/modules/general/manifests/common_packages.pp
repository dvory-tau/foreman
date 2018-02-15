class general::common_packages ($enable_Base_repo) {
#install some base common packages

#differntiate between ubuntu and centos
	if ($operatingsystem == "CentOS"){
		$vim_package="vim-enhanced"
		#differntiate between  centos 6 and 7
		if ($operatingsystemmajrelease == "6"){
			$nc="nc"
		}
		else {
			$nc="nmap-ncat"
		}
		$nfsclient="nfs-utils"
		if ($enable_Base_repo){

			exec {'enable_base_repo':
				path=>"/bin:/usr/bin:/usr/sbin/",
				command=>"sed -i '0,/enabled = 0/s//enabled = 1/' /etc/yum.repos.d/CentOS-Base.repo ",
			}

		}#if base

	        #Added by dvory
        	exec {'blast_install':
                	cwd=>'/root',
                	path    => ['/bin','/usr/bin', '/usr/sbin'],
                	command         => "wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.7.1/ncbi-blast-2.7.1+-1.x86_64.rpm;yum -y install /root/ncbi-blast-2.7.1+-1.x86_64.rpm",
	                unless          => "rpm -q ncbi-blast",
        	}
	        exec {'memlog_install':
        	        cwd=>'/root',
                	path    => ['/bin','/usr/bin', '/usr/sbin'],
	                command         => "wget http://lininst.tau.ac.il/MEMLOG_SGI/memlog-2.0-sgi713r4.rhel6.x86_64.rpm;yum -y install /root/memlog-2.0-sgi713r4.rhel6.x86_64.rpm",
        	        unless          => "rpm -q memlog",
        	} ->

	        service {'memlog':
        	        ensure=>running,
                	enable=>true,
        	}

	}#if centos

	if ($operatingsystem == "Ubuntu"){
		$vim_package="vim" 
		$nc="netcat"
		$nfsclient="nfs-common"
	}#if ubuntu

	if ($operatingsystem == "RedHat"){
		$vim_package="vim-enhanced"
		$nc="nc"
		$nfsclient="nfs-utils"
	}#if redhat


	yum::group { ['Development tools']:
		ensure  => present,

	}

#$common_packages_list = ["$vim_package","gcc","git","tree","dstat","screen","tbb","strace","ltrace","telnet","$nc","mc","nmap","emacs","fuse-libs","$nfsclient"]

	$common_packages_list = ["$vim_package","gcc","git","tree","dstat","screen","tbb","strace","ltrace","telnet","$nc","mc","nmap","emacs","fuse-libs","nano","gedit","elfutils"]

	ensure_packages($common_packages_list, {'ensure' => 'present'})

}
