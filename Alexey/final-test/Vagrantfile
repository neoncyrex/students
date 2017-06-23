
Vagrant.configure(2) do |config|

  config.vm.define "backend-1" do |myconf3|
    myconf3.vm.box = "centos/7"
    myconf3.vm.hostname = 'backend-1.lab.com'
    myconf3.vm.provision "shell", path: "centos-deployment.sh"
    myconf3.vm.network "forwarded_port", guest: 18080, host: 18080
    myconf3.vm.network "private_network", ip: "10.0.0.12",
      virtualbox__intnet: "public"
  end

  config.vm.define "backend-2" do |myconf4|
    myconf4.vm.box = "centos/7"
    myconf4.vm.hostname = 'backend-2.lab.com'
    myconf4.vm.provision "shell", path: "centos-deployment.sh"
    myconf4.vm.network "private_network", ip: "10.0.0.13",
      virtualbox__intnet: "public"
  end 

 config.vm.define "ansible" do |myconf1|
    myconf1.vm.box = "centos/7"
    myconf1.vm.hostname = 'www.lab.com'
    myconf1.vm.provision "shell", path: "ansible-deployment.sh"
    myconf1.vm.network "forwarded_port", guest: 80, host: 8000
    myconf1.vm.network "private_network", ip: "10.0.0.10",
      virtualbox__intnet: "public"
  end

end
