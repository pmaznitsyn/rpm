Vagrant.configure(2) do |config|

    config.vm.define "vm" do |v|
	v.vm.box = "generic/alma8"
	v.vm.hostname="vm"
        if Vagrant.has_plugin?("vagrant-vbguest") then
                config.vbguest.auto_update = false
        end
	v.vm.network :private_network, ip: "192.168.56.11"
	v.vm.box_check_update=false
        v.vm.provider "virtualbox" do |vb|
		vb.memory = "2048"
		vb.cpus = "2"
		vb.check_guest_additions=false
	end
    end

    config.ssh.insert_key = false 
    config.ssh.private_key_path = ['~/.vagrant.d/insecure_private_key', '~/.ssh/id_rsa']
    config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys" 
    config.vm.provision "shell", path: "provision.sh"
end
