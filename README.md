# saltstack-environment
vagrant saltstack environment for testing formulas (e.g. jira-formula)

## Quick Start
1. Install [vagrant](https://www.vagrantup.com/downloads.html).  You need a 
relatively new version (i.e. probably not the one in your system package manger),
otherwise you will run into problems trying to add the vagrant box (below).
2. Install virtualbox

  ```bash
  $ sudo apt-get install virtualbox
  ```
  
3. Clone this repo

  ```bash
  $ git clone https://github.com/vinylplz/saltstack-environment
  ```
  
4. Install formula dependancies like postgres and sun-java

  ```bash
  $ cd saltstack-environment
  saltstack-environment $ ./bin/install_formulas.sh
  Cloning into 'postgres-formula'...
  remote: Counting objects: 265, done.
  remote: Total 265 (delta 0), reused 0 (delta 0), pack-reused 265
  Receiving objects: 100% (265/265), 38.46 KiB | 0 bytes/s, done.
  Resolving deltas: 100% (103/103), done.
  Checking connectivity... done.
  Cloning into 'jira-formula'...
  remote: Counting objects: 20, done.
  remote: Compressing objects: 100% (17/17), done.
  remote: Total 20 (delta 1), reused 20 (delta 1), pack-reused 0
  Unpacking objects: 100% (20/20), done.
  Checking connectivity... done.
  Cloning into 'sun-java-formula'...
  remote: Counting objects: 95, done.
  remote: Total 95 (delta 0), reused 0 (delta 0), pack-reused 95
  Unpacking objects: 100% (95/95), done.
  Checking connectivity... done.
  Cloning into 'apache-formula'...
  remote: Counting objects: 444, done.
  remote: Compressing objects: 100% (32/32), done.
  remote: Total 444 (delta 16), reused 0 (delta 0), pack-reused 412
  Receiving objects: 100% (444/444), 67.93 KiB | 0 bytes/s, done.
  Resolving deltas: 100% (211/211), done.
  Checking connectivity... done.
  saltstack-environment$
  ```

5. Install the chef/debian-7.7 vagrant box if you don't have it already.  Choose the virtualbox provider.

  ```bash
  saltstack-environment$ vagrant box add chef/debian-7.7
  (...this can take a long time...)
  ```

6. Create the VM and install salt on it.  Doesn't apply any salt states.

  ```bash
  saltstack-environment$ vagrant up
  Bringing machine 'default' up with 'virtualbox' provider...
  ==> default: Importing base box 'chef/debian-7.7'...
  ==> default: Matching MAC address for NAT networking...
  ==> default: Checking if box 'chef/debian-7.7' is up to date...
  ==> default: Setting the name of the VM: saltstack-environment_default_1427484559112_17615
  ==> default: Clearing any previously set network interfaces...
  ==> default: Preparing network interfaces based on configuration...
      default: Adapter 1: nat
  ==> default: Forwarding ports...
      default: 80 => 8080 (adapter 1)
      default: 8080 => 8081 (adapter 1)
      default: 22 => 2222 (adapter 1)
  ==> default: Running 'pre-boot' VM customizations...
  ==> default: Booting VM...
  ==> default: Waiting for machine to boot. This may take a few minutes...
      default: SSH address: 127.0.0.1:2222
      default: SSH username: vagrant
      default: SSH auth method: private key
      default: Warning: Connection timeout. Retrying...
      default: 
      default: Vagrant insecure key detected. Vagrant will automatically replace
      default: this with a newly generated keypair for better security.
      default: 
      default: Inserting generated public key within guest...
      default: Removing insecure key from the guest if its present...
      default: Key inserted! Disconnecting and reconnecting using new SSH key...
  ==> default: Machine booted and ready!
  ==> default: Checking for guest additions in VM...
  ==> default: Mounting shared folders...
      default: /vagrant => /home/gforties/src/saltstack-environment
      default: /srv/salt => /home/gforties/src/saltstack-environment/salt
      default: /srv/pillar => /home/gforties/src/saltstack-environment/pillar
      default: /srv/formulas => /home/gforties/src/saltstack-environment/formulas
  ==> default: Running provisioner: salt...
  Copying salt minion config to vm.
  Checking if salt-minion is installed
  salt-minion was not found.
  Checking if salt-call is installed
  salt-call was not found.
  Bootstrapping Salt... (this may take a while)
  Salt successfully configured and installed!
  run_overstate set to false. Not running state.overstate.
  run_highstate set to false. Not running state.highstate.
  saltstack-environment$
  ```
  
7. log into the virtualbox VM created by vagrant

  ```bash
  vagrant ssh
  Linux packer-debian-7 3.2.0-4-amd64 #1 SMP Debian 3.2.63-2 x86_64
  
  The programs included with the Debian GNU/Linux system are free software;
  the exact distribution terms for each program are described in the
  individual files in /usr/share/doc/*/copyright.
  
  Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
  permitted by applicable law.
  You have mail.
  Last login: Sun Oct 26 02:40:30 2014 from 10.0.2.2
  vagrant@packer-debian-7:~$
  ```

8. run `salt-call`.  This is similar to `puppet apply` or `chef-client`

  ```bash
  vagrant@packer-debian-7:~$ sudo salt-call state.highstate
  [INFO    ] Loading fresh modules for state activity
  [INFO    ] Fetching file from saltenv 'base', ** done ** 'top.sls'
  [INFO    ] Creating module dir '/var/cache/salt/minion/extmods/modules'
  [INFO    ] Syncing modules for environment 'base'
  [INFO    ] Loading cache from salt://_modules, for base)
  (...)
  ```
