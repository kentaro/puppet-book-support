class app::td-agent::config {
  file { '/etc/td-agent/conf.d/app.conf':
    content => template('app/td-agent/app.conf'),
  }
}
