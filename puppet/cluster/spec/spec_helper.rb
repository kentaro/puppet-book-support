require 'serverspec'
require 'pathname'
require 'net/ssh'

RSpec.configure do |c|
  c.sudo_password = ENV['SUDO_PASSWORD']
  c.include(Serverspec::Helper::Ssh)
  c.include(Serverspec::Helper::RedHat)
  c.before do
    host  = File.basename(Pathname.new(example.metadata[:location]).dirname)
    if c.host != host
      c.ssh.close if c.ssh
      c.host  = host
      options = Net::SSH::Config.for(c.host)
      user    = options[:user] || Etc.getlogin
      c.ssh   = Net::SSH.start(c.host, user, options)
      c.os    = backend(Serverspec::Commands::Base).check_os
    end
  end
end
