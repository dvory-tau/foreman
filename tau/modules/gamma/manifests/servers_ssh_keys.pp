class gamma::servers_ssh_keys{

ssh_authorized_key { 'root@gamma.tau.ac.il':
  ensure => present,
  user   => 'root',
  type   => 'ssh-rsa',
  key=> 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDbaMhlsnT1KT37D+gI1xdi/vKrnSW4oe8h+HEelf1sTyJivDEFEnIo2ZNds+03fUBIjTbetcUUGTSa+KWaPB0T60pum+rlWcuszp+tWzUPYUolJcQhIwUl226kYc3MarQ1TCKEz/Xos1Ug7NRPnaGsKXW9rstPjXTx60eeEIX7B/+beku8L/2H1yxGVI4N1UvXfQklhcgxfzMuybabESukTFm18fAp/AnBAVLPhJfbCKrt5ItnvW1v4SoGsFNVtq+jtHZo6zCTQS0w61VWtdwcJwRwW67RKvSG7saPAm0vW2uAMpWa9zk6tVRq4rjMG0boSd/1OTVW/SUA5Ttwyicf',
}

}
