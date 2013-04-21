define td-agent::plugin (
  $ensure = 'present'
) {
  $plugin_name = "fluent-plugin-${title}"

  Exec {
    path => '/bin:/usr/lib64/fluent/ruby/bin',
  }

  if $ensure == 'present' {
    exec { "fluent-gem install ${plugin_name}":
      command => "fluent-gem install ${plugin_name}",
      unless  => "fluent-gem list | grep ${plugin_name} 2>/dev/null",
    }
  }
  elsif $ensure == 'absent' {
    exec { "fluent-gem uninstall ${plugin_name}":
      command => "fluent-gem uninstall ${plugin_name}",
      onlyif  => "fluent-gem list | grep ${plugin_name} 2>/dev/null",
    }
  }
  else {
    fail "${ensure} for `ensure` is not supported!"
  }
}
