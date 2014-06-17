# -*- mode: ruby -*-
# vi: set ft=ruby :

KALDI_PREFIX = "/kaldi"
KALDI_REPO   = "kaldi"
KALDI_HOME   = "#{KALDI_PREFIX}/#{KALDI_REPO}"

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "kaldibox", primary: true do |v|
    v.vm.box = "precise64"
    v.vm.box_url = "http://files.vagrantup.com/precise64.box"

    v.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--memory", "2048"] # in MB
      v.customize ["modifyvm", :id, "--cpus", "4"]
    end

    v.vm.synced_folder "kaldi", KALDI_PREFIX, create: true

    v.vm.provision "shell", inline: <<-EOF
      su -l vagrant -c 'cp /vagrant/scripts/user.sh ~/.bash_profile'
      su -l vagrant -c "sed -i 's,___KALDI_HOME___,#{KALDI_HOME},' ~/.bash_profile"
    EOF
    v.vm.provision "shell",
      path: "scripts/init.sh",
      args: [KALDI_PREFIX, KALDI_REPO],
      privileged: true
  end
end
