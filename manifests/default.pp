node 'web1' {
  class { 'apache':
    mpm_module  => 'prefork'
  }

  class { '::apache::mod::php': }

  apache::vhost { 'lamp':
  port    => '80',
  docroot => '/vagrant/pc',
  }

  class { '::mysql::server':
    root_password => 'mystrongpassword',
    }
}
