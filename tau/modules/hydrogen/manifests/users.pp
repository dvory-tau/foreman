class hydrogen::users {

/*
user { 'backups':
  ensure           => 'present',
  gid              => '0',
  home             => '/export/home/backups',
  password         => '!!',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/tcsh',
  uid              => '0',
}
*/
user { 'chu':
  ensure           => 'present',
  gid              => '513',
  groups           => ['gaussian'],
  home             => '/export/home/chu',
  password         => '$1$MTI3.ywB$OCdzGp/gFgFQbAl4ufZIr.',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '513',
}
user { 'danny':
  ensure           => 'present',
  gid              => '500',
  home             => '/export/home/danny',
  password         => '$1$qO2tT9iZ$Tsdu3qwM.MVDr9WLo1eEs1',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '500',
}
user { 'dvory':
  ensure           => 'present',
  gid              => '523',
  home             => '/export/home/dvory',
  password         => '$1$YVdY5oM0$6UFH/BbACg3Z5FaBpVsaO1',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '522',
}
user { 'einat':
  ensure           => 'present',
  gid              => '507',
  home             => '/export/home/einat',
  password         => '$1$sQf2SabB$BrAjXB.axviabcte8cgVc1',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '507',
}
user { 'guy':
  ensure           => 'present',
  gid              => '512',
  home             => '/export/home/guy',
  password         => '$1$RUKb.vs0$qnRma8o7hfmwjWGO.SeGE/',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '512',
}
user { 'inbal':
  ensure           => 'present',
  gid              => '522',
  home             => '/export/home/inbal',
  password         => '$1$AFotGkKK$JzJ11lz7luuW0xuEViKdK1',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '521',
}
user { 'inonshar':
  ensure           => 'present',
  gid              => '504',
  home             => '/export/home/inonshar',
  password         => 'vIlhLRxn2hQmk',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '504',
}
user { 'maui':
  ensure           => 'present',
  comment          => 'Maui System Administrator',
  gid              => '511',
  home             => '/opt/maui',
  password         => '!!',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '511',
}
user { 'migliore':
  ensure           => 'present',
  gid              => '514',
  groups           => ['chem-group'],
  home             => '/export/home/migliore',
  password         => '$1$pLMqzVxm$0eiDYlIN3pxUiuqfCnWT.1',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '514',
}
user { 'misha':
  ensure           => 'present',
  gid              => '506',
  home             => '/export/home/misha',
  password         => '$1$aU1uIvj5$8JY450xVVzSOJeamYMNvq0',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '506',
}
user { 'mordkov':
  ensure           => 'present',
  comment          => 'mordkov',
  gid              => '1000',
  groups           => ['wheel', 'mordkov'],
  home             => '/export/home/mordkov',
  password         => '$6$1xi0BQwqTrgUH288$OmI3J60drgcLHcNMniZRGYi.D5DRYHlOCCv24YAvjM9kSIp8cPL5hEL3Wk8dwnXCa1djEaeenEiDVVk.4q56o0',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '1000',
}
user { 'nitzan':
  ensure           => 'present',
  gid              => '501',
  groups           => ['chem-group'],
  home             => '/export/home/nitzan',
  password         => '$1$YEPiYnqT$75qDjoUviQpEuodvn4vN6.',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '501',
}
user { 'noa':
  ensure           => 'present',
  comment          => 'Noa Freifeld',
  gid              => '516',
  home             => '/export/home/noa',
  password         => '$1$nEoiHXBY$mzNer/Ylky1mU.sAiMq/a.',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '516',
}
user { 'oded':
  ensure           => 'present',
  gid              => '510',
  home             => '/export/home/oded',
  password         => '$1$MzDar1y2$XRFyfFGwLIrHDgKGHT5s61',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/tcsh',
  uid              => '510',
}
user { 'ogodsi':
  ensure           => 'present',
  gid              => '517',
  home             => '/export/home/ogodsi',
  password         => '$1$SKkM.aLr$bDpR6/5Z064ZI3fu5mhmt.',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '517',
}
user { 'renai':
  ensure           => 'present',
  gid              => '524',
  home             => '/export/home/renai',
  password         => '$1$en/t1rC9$iKYDIjFnN/mOGVzqx773u/',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '524',
}
user { 'yonatant':
  ensure           => 'present',
  gid              => '508',
  home             => '/export/home/yonatant',
  password         => 'E6uhAne4rUNTg',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '508',
}

}
