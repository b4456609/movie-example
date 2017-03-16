# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "ci" do |ci|
    ci.vm.box = "debian/jessie64"
    ci.vm.hostname = 'ci'

    ci.vm.network "private_network", ip: "192.168.33.10"

    ci.vm.provider :virtualbox do |v|
      v.memory = "2048"
    end

    ci.vm.provision :docker
    ci.vm.provision :docker_compose, yml: "/Vagrant/tool/docker-compose.yml", run: "always"
  end
  config.vm.define "test" do |test|
    test.vm.box = "debian/jessie64"
    test.vm.hostname = 'test'

    test.vm.network "private_network", ip: "192.168.33.11"

    test.vm.provider :virtualbox do |v|
      v.memory = "1024"
    end
  end
  config.vm.define "pro" do |pro|
    pro.vm.box = "debian/jessie64"
    pro.vm.hostname = 'pro'

    pro.vm.network "private_network", ip: "192.168.33.12"

    pro.vm.provider :virtualbox do |v|
      v.memory = "1024"
    end
  end
end
