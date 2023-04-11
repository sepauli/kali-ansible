Kali Linux Setup
=========

Install Tools and configure a Kali Linux setup


Example
----------------

setup kali-linux environment
```
ansible-playbook --connection=local --ask-become-pass -i inventory/default/hosts.yml playbooks/all.yml
```