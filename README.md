# Born2BeRoot
## Part 1: setup and Partitioning

## Part 2: setups
- install sudo (as root): \
`apt install sudo`
- edit the `/etc/sudoers` file according to the one in the repo. see [here](https://manpages.debian.org/bullseye/sudo-ldap/sudoers.5.en.html) for documentation
- install `libpam-pwquality` for password rules. see [here](https://manpages.debian.org/testing/libpam-pwquality/pam_pwquality.8.en.html) for documentation.
- change the password expiry rules: edit `/etc/login.defs` see [here](https://manpages.debian.org/unstable/login/login.defs.5.de.html) for documentation.
- AppArmor: runs by default. see [here](https://wiki.debian.org/AppArmor/HowToUse) for documentation
- UFW: install ufw with `apt install ufw`. For configuration see [here](https://wiki.debian.org/Uncomplicated%20Firewall%20%28ufw%29)

## Part 3: Script
