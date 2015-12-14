Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  #config.vm.box = "ubuntu/trusty64"

  config.vm.define "web_1" do |web_1|
    web_1.vm.box = "ubuntu/trusty64" #vm.box = "apache"#
    web_1.vm.hostname = "lamp"
    web_1.vm.network "private_network", ip: "192.168.50.40"
    web_1.vm.provision :shell, path: "bootstrap-lamp.sh"
  end

  config.vm.define "web_2" do |web_2|
    web_2.vm.box = "ubuntu/trusty64" #vm.box = "apache"#
    web_2.vm.hostname = "nagios"
    web_2.vm.network "private_network", ip: "192.168.50.41"
    web_2.vm.provision :shell, path: "bootstrap-lamp.sh"
  end

  config.vm.define "varnish" do |varnish|
    varnish.vm.box = "ubuntu/trusty64" #vm.box = "apache"#
    varnish.vm.hostname = "puppet"
    varnish.vm.network "private_network", ip: "192.168.50.2"
    varnish.vm.provision :shell, path: "varnish.sh"

end

  end
