class astro::users {


     group { 'student':
        ensure           => 'present',
        gid              => '36674',
     }

     group { 'guests':
        ensure           => 'present',
        gid              => '504',
     }

     group { 'ybenham':
        ensure           => 'present',
        gid              => '500',
     }

     group { 'michail':
        ensure           => 'present',
        gid              => '501',
     }

     group { 'danny':
        ensure           => 'present',
        gid              => '503',
     }

     group { 'piniko':
        ensure           => 'present',
        gid              => '506',
     }

     group { 'dvory':
        ensure           => 'present',
        gid              => '507',
     }
/*
     user { 'ybenham':
       	ensure           => 'present',
       	gid              => '500',
       	home             => '/storage/home/ybenham',
       	password         => '!!',
       	shell            => '/bin/bash',
       	uid              => '500',
     }
*/
     user { 'oregottlieb':
       	ensure           => 'present',
       	gid              => '36674',
       	home             => '/storage/home/oregottlieb',       
	password	 => '$5$zuXw.nKU$sC4WicM1TTvWqz4tTrwHUhiLs6UgzxJaggjnXoxcxY7',
       	shell            => '/bin/bash',
       	uid              => '88528',
     }

     user { 'omerbr':
       	ensure           => 'present',
       	gid              => '36674',
       	home             => '/storage/home/omerbr',       
	password	 => '!!',
       	shell            => '/bin/bash',
       	uid              => '20624',
     }

     user { 'richardh':
       	ensure           => 'present',
       	gid              => '36674',
       	home             => '/storage/home/richardh',
	password	 => '$6$QEPJuhrL$EA3HGFJAw2ucqXGfTOCH1laNh5Um4uINELFM57Z02YSC0Cb6sX4MuYNzfLUgjIjdqfcBE4bExrhDczKO9WMY5/',
       	shell            => '/bin/bash',
       	uid              => '28363',
     }

     user {'itamarreis':
	ensure           => 'present',
      	gid              => '36674',
      	home             => '/storage/home/itamarreis',
	password	 => '$5$JeIjsIUa$xllr0DtF/g6CNcRHqmZhKha/DNCshLuHYDPv9xTw8IA',
       	shell            => '/bin/bash',
       	uid              => '35332',
     }

     user { 'michail':
       	ensure           => 'present',
       	gid              => '501',
       	home             => '/storage/home/michail',
	password	 => '$5$Skwownv5$Lt6odU9w8r9cxkIpMCFoxfC86i4FoYNSjb6STKBajB8',
       	shell            => '/bin/bash',
       	uid              => '501',
     }
/*     user { 'piniko':
        ensure           => 'present',
        gid              => '506',
        home             => '/storage/home/piniko',
        shell            => '/bin/bash',
        uid              => '506',
     }
*/
     user { 'dvory':
        ensure           => 'present',
        gid              => '507',
        home             => '/storage/home/dvory',
	password	 => '$5$rzZzqLdg$oYAHFDfq7lim1Yfk9YBWuxUC0pT7vuMu00QZ9TMZRpA',
        shell            => '/bin/bash',
        uid              => '507',
     }


     user {'yishayvadai':
        ensure           => 'present',
        gid              => '36674',
        home             => '/storage/home/yishayvadai',
	password	 => '$6$VShCuTho$phjJ4pMx/fsn3LDjQI9/NDSDZaqxOh5W41sXYGvfzAs7pBDqp3npVAE83vtPC0G6S/UZx/xmXa.1pnWaTV4M8.',
        shell            => '/bin/bash',
        uid              => '90888',
     }     

     user {'sarelg':
        ensure           => 'present',
        gid              => '36674',
        home             => '/storage/home/sarelg',
	password	 => '$6$9qPSUjx7$VzEbUuDSPeSgr2.Kjgk5j8DK6cODZ9QUE/JYNIGxLRUl/PeUbvPsrNwYpDiCMYa8cXRlhP5SClGTSxk936Y7C.',
        shell            => '/bin/bash',
        uid              => '96649',
     }

     user {'meirzh':
        ensure           => 'present',
        gid              => '36674',
        home             => '/storage/home/meirzh',
	password	 => '$6$8F4KfR6O$9rBaK4LIibOe7EAKw0rsvalYzCKTYRnVOZ7UBWFBAm8WQr/xFhIUqbn1Le1vOa.vDPCcFR.QGFym6tlsVtyrR/',
        shell            => '/bin/bash',
        uid              => '85986',
     }

     user {'matanfri':
        ensure           => 'present',
        gid              => '36674',
        home             => '/storage/home/matanfri',
	password 	 => '$6$KCcSmY1n$3oLWk/6bcKtWNhhUOqKl.ucWj.UVmy.mkvINaxJUS37wZAOCU5rL7pJrVcSSIvWGOJjvvQv1e7Ggz5CbfmKQ60',
        shell            => '/bin/bash',
        uid              => '127824',
     }

     user {'danielkagan':
        ensure           => 'present',
        gid              => '36674',
        home             => '/storage/home/danielkagan',
	password	 => '$5$ALke9QlM$MHCbTRmXWCz1in28vrjhDTTRXqjY2.mbfLFuTH/PsN0',
        shell            => '/bin/bash',
        uid              => '31705',
     }

     user {'hadarco6':
        ensure           => 'present',
        gid              => '504',
        home             => '/storage/home/hadarco6',
        password         => '!!',
        shell            => '/bin/bash',
        uid              => '505',
     }

     user {'omer':
        ensure           => 'present',
        gid              => '504',
        home             => '/storage/home/omer',
        password         => 'Ro.SHOIzM3Alc',
        shell            => '/bin/bash',
        uid              => '20625',
     }

     user {'savion':
        ensure           => 'present',
        gid              => '504',
        home             => '/storage/home/savion',
        password         => 'wabM30II.uIFc',
        shell            => '/bin/bash',
        uid              => '43007',
     }

     user { 'danny':
       	ensure           => 'present',
       	gid              => '503',
       	home             => '/storage/home/danny',
	password	 => '$5$OYGoY26r$XDM/11EDoTTf7hgCcyzuXzjrQgC30W9U4Yl4avWhXfA',
       	shell            => '/bin/bash',
       	uid              => '503',
     }


     user { 'mordkov':
       	ensure           => 'present',
       	gid              => '503',
       	home             => '/storage/home/mordkov',
	password	 => '$6$AyrS9seR$Mr1CPgzkFrdvczdXzQ4LbPwauombxkk/SIjQnPRKr1Zdt7YJEhSoT.aNdGVa4HbeZB8Anh35LaL3w.S2zqRpe.',
       	shell            => '/bin/bash',
       	uid              => '43008',
     }

     user { 'cbsastro82':
       	ensure           => 'present',
       	gid              => '36674',
       	home             => '/storage/home/cbsastro82',
	password	 => '$6$.oDQwKx2$WuHEoZwhXQLBHTU7y8iE1j3Ubkx334gHEJEaPLFz3Mefgpl2oWLNVc.GJkShU1zRm2Y8yz24skqxqKWzNpvs20',
       	shell            => '/bin/bash',
       	uid              => '43009',
     }

}

