class iptables::service {
  service { 'iptables':
    enable => false,
    ensure => stopped,
  }
}
