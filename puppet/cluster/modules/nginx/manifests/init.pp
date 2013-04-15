class nginx {
  include nginx::install
  include nginx::config
  include nginx::service

     Class['nginx::install']
  -> Class['nginx::config']
  ~> Class['nginx::service']
}
