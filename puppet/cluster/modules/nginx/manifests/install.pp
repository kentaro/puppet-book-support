class nginx::install {
  yumrepo { 'nginx':
    descr    => 'nginx yum repository',
    baseurl  => 'http://nginx.org/packages/centos/6/$basearch/',
    enabled  => 1,
    gpgcheck => 0,
  }

  package { 'nginx':
    require => Yumrepo['nginx'],
  }

  file { '/var/log/nginx':
    ensure  => directory,
    owner   => 'nginx',
    group   => 'nginx',
    mode    => '0755',
    require => Package['nginx'],
  }
}
