class app::td-agent {
  include ::td-agent
  include app::td-agent::config

     Class['::td-agent']
  -> Class['app::td-agent::config']
  ~> Class['::td-agent::service']
}
