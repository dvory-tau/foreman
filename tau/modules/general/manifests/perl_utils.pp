class general::perl_utils{
# Required for prokka
	if $operatingsystem == "CentOS" {
                package { ['perl-Time-Piece', 'perl-XML-Simple', 'perl-Digest-MD5', 'java-1.8.0-openjdk', 'perl-CPAN', 'perl-Module-Build']:
			ensure => present,
			provider => yum,
		} 
	}

}#class
