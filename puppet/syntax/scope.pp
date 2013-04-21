# top scope
$top = "Hello, Puppet!"

class foo {
  notice($top)                 #=> "Hello, Puppet!"
}

include foo

# local scope
$to_be_overwritten = "top"

class bar {
  $local = "Hello, Puppet!"
  notice($local)               #=> "Hello, Puppet!"

  $to_be_overwritten = "local"
  notice($to_be_overwritten)   #=> "local"
}

include bar

notice($local)                 #=> undef
notice($to_be_overwritten)     #=> "top"

# Out-of-scope variable
class baz {
  $local = "baz"
}

class hoge {
  include baz
  notice($baz::local)          #=> "baz"
}

include hoge
