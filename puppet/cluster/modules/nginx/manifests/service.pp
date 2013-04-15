class nginx::service {
  service { 'nginx':
    enable     => true,
    ensure     => running,
    hasrestart => true,
  }
}
