class td-agent::config {
  file { '/etc/td-agent/td-agent.conf':
    content => template("td-agent/td-agent.conf"),
  }

  file { '/etc/td-agent/conf.d':
    ensure => directory,
  }
}
