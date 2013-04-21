class log::td-agent::plugin {
  td-agent::plugin { 'extract_query_params':
    ensure => present,
  }
}
