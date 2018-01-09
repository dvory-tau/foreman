class lecs::users {


     group { 'dvory1':
        ensure           => 'present',
        gid              => '59382',
     }

     user { 'dvory1':
        ensure           => 'present',
        gid              => '59382',
        home             => '/share/home/dvory1',
	password	 => '$5$rzZzqLdg$oYAHFDfq7lim1Yfk9YBWuxUC0pT7vuMu00QZ9TMZRpA',
        shell            => '/bin/bash',
        uid              => '59381',
     }
}
