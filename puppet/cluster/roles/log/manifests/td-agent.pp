class log::td-agent {
  include ::td-agent
  include log::td-agent::config

     Class['::td-agent::install']
  -> Class['log::td-agent::config']
  ~> Class['::td-agent::service']
}
