Facter.add(:rocks_cluster) do
  setcode do
    1
  end
end

Facter.add(:rocks_headnode) do
  setcode do
    if File.exist? '/var/spool/torque/server_name' # PBS
      Facter::Core::Execution.exec('cat /var/spool/torque/server_name')
    elsif File.exist? '/opt/gridengine/default/common/settings.sh' # SGE
      Facter::Core::Execution.exec('sed -n "s/SGE_CLUSTER_NAME=\(.*\);.*$/\1/p" /opt/gridengine/default/common/settings.sh')
    elsif File.exist? '/var/spool/PBS/mom_priv/config' # PBS Pro
      Facter::Core::Execution.exec('sed -n "s/^\$clienthost \(.*\)$/\1/p" /var/spool/PBS/mom_priv/config')
    else
      'undef'
    end
  end
end

Facter.add(:rocks_protection_status) do
  setcode do
    if File.exist? '/var/lib/puppet/state/.disable_protection'
      0 
    else
      1
    end
  end
end
