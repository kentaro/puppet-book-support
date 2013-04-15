class app {
  include app::nginx
  include app::td-agent

     Class['app::nginx']
  -> Class['app::td-agent']
}
