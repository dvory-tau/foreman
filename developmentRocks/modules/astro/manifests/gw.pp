class astro::gw {

  exec { "define_default_gw":
      command => '/usr/sbin/ip route replace default via 192.168.200.253',
      onlyif => '/usr/sbin/route -n | grep 192.168.200.253',
  }

}
