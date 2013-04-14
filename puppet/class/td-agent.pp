class td-agent {
  include td-agent::install
  include td-agent::config
  include td-agent::service

     Class['td-agent::install']
  -> Class['td-agent::config']
  ~> Class['td-agent::service']
}

class td-agent::install {
  yumrepo { 'treasuredata':
    name     => 'treasuredata',
    descr    => 'treasuredata repo',
    baseurl  => 'http://packages.treasure-data.com/redhat/$basearch/',
    enabled  => 1,
    gpgcheck => 0,
  }

  package { 'td-agent':
    ensure  => installed,
    require => Yumrepo['treasuredata'],
  }
}

class td-agent::config {
  file { '/etc/td-agent/td-agent.conf':
    content => template("td-agent.conf"),
  }
}

class td-agent::service {
  service { 'td-agent':
    enable     => true,
    ensure     => running,
    hasrestart => true,
  }
}

include td-agent
