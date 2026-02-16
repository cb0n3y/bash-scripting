# Vagrant First Steps

---

## Environment

- OS: Rocky Linux 10 (GNOME Desktop)
- Provider: VirtualBox
- Vagrant Version: 2.4.9

---

## 1. Vagrant Installation

- Add HashiCorp Repository:
```bash
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
```

- Install Vagrant:
```bash
sudo dnf -y install vagrant
```

- Verify Installation:
```bash
vagrant --version
Vagrant 2.4.9
```

This assumes that VirtualBox is already installed. For more information about how to install Vagrant on your OS,
please visit: [Install Vagrant](https://developer.hashicorp.com/vagrant/install)

---

## 2. Create Your First VM

- Commands to initialize and start a VM

```bash
vagrant init hashicorp/bionic64
vagrant up
```

This initializes a Vagrantfile using the `hashicorp/bionic64` base box (Ubuntu 18.04).

---

## 3. Useful Commands

- Start, Stop and Destroy a VM

```bash
# start a vm
vagrant up vm01 [vm02 ....]

# Stop the vm
vagrant halt vm01

# Destroy the vm
vagrant destroy vm01
```

- Reboot the vm

```bash
vagrant reload
```

- Suspend the vm

```bash
vagrant suspend vm01
```

- Resume the vm:

```bash
vagrant resume vm01
```
- Check VM Status:

```bash
vagrant status
```

- Connect via SSH

```bash
vagrant ssh vm01
```

For more commands:

```bash
vagrant list-commands
```

---

## 4. Notes & Observations

You can declare multiple vms in a single Vagrant file. This is referred to as a **multi-machine setup** in Vagrant.
When using that multi-machine setup, you can either start all the vms at once or specify which vm you wanna
start.

Each VM can have:
- Its own hostname
- Its own IP address
- Different roles (e.g., web, db, loadbalancer)

Example: [Vagrantfile](../vm1/Vagrantfile)

```bash
# Start all vms
vagrant up

# Start a specific VM
vagrant up vm01
```

- [Vagrant Documentation](https://www.vagrantup.com/docs)
