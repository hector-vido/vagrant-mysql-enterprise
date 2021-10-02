# MySQL

This `Vagrantfile` provision two machines with Debian 10 ready to install MySQL 8.0 enterprise edition.

You should download `.deb` packages from Oracle's website and put then in `mysql` directory.

## Provision

To provision this machines, install [vagrant](https://www.vagrantup.com/) in your machine and some **hypervisor** as [VirtualBox](https://www.virtualbox.org/) or [Libvirt](https://libvirt.org/).

Clone the repository:

```bash
git clone 'https://github.com/hector-vido/vagrant-mysql-enterprise.git'
```

Enter in the created directory and starts `vagrant`:

```bash
cd vagrant-mysql-enterprise
vagrant up
```

Verify what machines are running:

```bash
vagrant status
#Current machine states:
#
#db1                       running (virtualbox)
#db2                       running (virtualbox)
```

Access one of the machines with it name:

```bash
vagrant ssh db1
```

## Machines

| Nome    | Distro    | IP           |
|---------|-----------|--------------|
| db1     | Debian 10 | 172.27.11.10 |
| db2     | Debian 10 | 172.27.11.20 |
