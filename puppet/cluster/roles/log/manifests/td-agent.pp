class log::td-agent {
  include ::td-agent
  include log::td-agent::config
  include log::td-agent::plugin

     Class['::td-agent::install']
  -> Class['log::td-agent::config']
  ~> Class['::td-agent::service']

     Class['::td-agent::install']
  -> Class['log::td-agent::plugin']
  ~> Class['::td-agent::service']
}
