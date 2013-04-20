class log::td-agent::config {
  file { '/etc/td-agent/conf.d/log.conf':
    content => template('log/td-agent/log.conf'),
  }

  file { '/var/log/td-agent/app':
      ensure => directory,
      owner  => 'td-agent',
      group  => 'td-agent',
  }
}
