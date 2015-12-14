Vagrant.configure(2) do |config|

  config.vm.define "web1" do |web1|
    web1.vm.box = "ubuntu/trusty64" #vm.box = "apache"#
    web1.vm.hostname = "web1"
    web1.vm.network "private_network", ip: "192.168.50.40"
    web1.vm.provision :shell, path: "bootstrap-lamp.sh"
    web1.vm.provision "puppet" do |puppet|
      puppet.module_path = "modules"
    end
  end

  config.vm.define "web2" do |web2|
    web2.vm.box = "ubuntu/trusty64" #vm.box = "apache"#
    web2.vm.hostname = "web2"
    web2.vm.network "private_network", ip: "192.168.50.41"
    web2.vm.provision :shell, path: "bootstrap-lamp.sh"
    web2.vm.provision "puppet" do |puppet|
      puppet.module_path = "modules"
    end
  end

  config.vm.define "varnish" do |varnish|
    varnish.vm.box = "ubuntu/trusty64" #vm.box = "apache"#
    varnish.vm.hostname = "varnish"
    varnish.vm.network "private_network", ip: "192.168.50.2"
    varnish.vm.network :forwarded_port, guest: 80, host: 8080
    varnish.vm.provision :shell, path: "varnish.sh"
  end
end
