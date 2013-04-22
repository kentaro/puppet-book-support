require 'spec_helper'

describe 'nginx' do
  it { should be_installed }
  it { should be_enabled   }
  it { should be_running   }
end

describe 'port 80' do
  it { should be_listening }
end

describe '/etc/nginx/conf.d/my.conf' do
  it { should be_file }
  it { should contain "server_name  app.puppet-book.local;" }
end

describe '/usr/share/nginx/html/index.html' do
  it { should be_file }
  it { should contain "Hello, Puppet!" }
end
