class astro::params {
 
  $firewall_enabled = false

  $pbspro_execute = true

  $infiniband_host_number =  regsubst($hostname,'^compute-(\d+)-(\d+)','\2')

  $infiniband_pci_number = "07:00:00"
  $infiniband_update_from = "2.11.15"
  $infiniband_update_psid = "HP_0230240009"
  $infiniband_update_filename = "/share/distrib/mlnx/fw-ConnectX3.bin"

}
