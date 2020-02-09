# mantisbt

### Build With
* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](https://www.vagrantup.com/)
* [Ansible](https://docs.ansible.com/ansible/2.7/)
* [Docker](https://docs.docker.com/)
* [Docker Compose](https://docs.docker.com/compose/)


### Requirements
* [VirtualBox >= 5.2.18](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant >= 2.0.2](https://www.vagrantup.com/downloads.html)


### Up and Running
```
$ git clone https://github.com/victorguerra1406/mantisbt-vagrant.git
$ cd mantisbt-vagrant
$ vagrant up
```


### Usage
##### Install Docker
```
$ vagrant up --provision-with install
```
##### Start MantisBT
```
$ vagrant provision --provision-with start
```
##### Stop MantisBT
```
$ vagrant provision --provision-with stop
```
##### Restart MantisBT
```
$ vagrant provision --provision-with restart
```
##### Destroy MantisBT
```
$ vagrant provision --provision-with destroy
```
##### Shutdown Virtual Machine
```
$ vagrant halt
```
##### Shutdown Virtual Machine and Destroys All Resources 
```
$ vagrant destroy
```


### Installation Options
```
Type of Database                                        MySQL/MySQLi
Hostname (for Database Server)                          mysql
Username (for Database)                                 mantisbt
Password (for Database)                                 mantisbt
Database name (for Database)                            bugtracker
Admin Username (to create Database if required)         root
Admin Password (to create Database if required)         root
Default Time Zone                                       Sao Paulo
Print SQL Queries instead of Writing to the Database    [ ]
Attempt Installation                                    [Install/Upgrade Database]
```