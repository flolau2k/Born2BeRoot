# Born2BeRoot
## Part 1: setup and Partitioning

## Part 2: setups
- install sudo (as root): `apt install sudo`

- edit the `/etc/sudoers` file according to the one in the repo. see [here](https://manpages.debian.org/bullseye/sudo-ldap/sudoers.5.en.html) for documentation.

- change the ssh settings: `nano /etc/ssh/sshd_config`. see [here](https://manpages.debian.org/unstable/openssh-server/sshd_config.5.en.html) for documentation.

- install `libpam-pwquality` for password rules. edit `/etc/security/pwquality.conf` \
 see [here](https://manpages.debian.org/testing/libpam-pwquality/pam_pwquality.8.en.html) for documentation.

- change the password expiry rules: edit `/etc/login.defs` see [here](https://manpages.debian.org/unstable/login/login.defs.5.de.html) for documentation.

- AppArmor: runs by default. see [here](https://wiki.debian.org/AppArmor/HowToUse) for documentation.

- UFW: install ufw with `apt install ufw`. For configuration see [here](https://wiki.debian.org/Uncomplicated%20Firewall%20%28ufw%29)

## Part 3: Script
- display the architecture and the kernel version: `uname -a`

- count of processors: see [tutorial](https://www.networkworld.com/article/2715970/counting-processors-on-your-linux-box.html) for more info

	- number of physical cores: \
	```grep "processor" /proc/cpuinfo | wc -l```
	- number of vCores:\
	```grep "cpu cores" /proc/cpuinfo | uniq```

- RAM availability: see [tutorial](https://qualitestgroup.com/insights/technical-hub/how-to-find-the-physical-memory-available-on-a-system-through-the-command-line/) and [wiki awk](https://wiki.ubuntuusers.de/awk/) for more info 

	```free -m | grep "^Mem:" | awk '{printf("Memory Usage: %d/%dMB (%.1f%%)"),$3, $2, $3 / $2 * 100 }'```

- Disk Usage. See [wiki awk](https://wiki.ubuntuusers.de/awk/) and [gnu awk examples](https://www.gnu.org/software/gawk/manual/html_node/Printf-Examples.html) for more info.
	- Approach: get the disk usage with the `df` command. use options to get MB or GB and filter for the relevant partitions with grep. use awk to print only the right column. get it all into one line with tr. use awk to sum up all values.

- CPU Usage. see here for more info: [gnu awk examples](https://www.gnu.org/software/gawk/manual/html_node/Printf-Examples.html), [xargs wiki](https://wiki.ubuntuusers.de/xargs/), [cut wiki](https://wiki.ubuntuusers.de/cut/)

	```top -bn1 | grep '^%Cpu' | cut -c 9- | xargs | awk '{printf("%.1f%%"), $1 + $2 + $3}'```

- Last boot: use the `uptime` command. (see manpage!)

- check LVM: use `lsblk` to check all partitions. grep `lvm`. Check if output is greater than 0 and decide on that what to print. see [bash if else tutorial](https://ryanstutorials.net/bash-scripting-tutorial/bash-if-statements.php) for more info.

- check active TCP connections with `ss`. grep for established only and count number.

- check active users: use the `who` command. use `uniq` to count individual users only (not sessions, if one user has multiple!) and count with `wc`

- Network IP and MAC Address: use the `hostname` command to show the IP Address (see man page) and use grep the MAC Address from the output of `ip a`.

- Number of sudo commands: check the sudo.log file with cat `/var/log/sudo/sudo.log` and grep for `COMMAND`. count lines, done.