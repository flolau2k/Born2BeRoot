echo "	#Architecture: $(uname -a)"
echo "	#CPU physical : $(grep "processor" /proc/cpuinfo | wc -l)"
echo "	#vCPU: $(grep "cpu cores" /proc/cpuinfo | uniq | wc -l)"
free -m | grep "^Mem:" | awk '{printf("	#Memory Usage: %d/%dMB (%.1f%%)\n"),$3, $2, $3 / $2 * 100 }'
dused=$(df -BMB | grep "LVMGroup" | awk '{print $3}' | tr "%\n" " " | awk '{ for(i=1;i<=NF;i++) sum+=$i }END{printf("%d\n", sum)}')
dtotal=$(df -BGB | grep "LVMGroup" | awk '{print $2}' | tr "%\n" " " | awk '{ for(i=1;i<=NF;i++) sum+=$i }END{printf("%d\n", sum)}')
dup=$(df -BGB | grep "LVMGroup" | awk '{print $2}' | tr "%\n" " " | awk '{ for(i=1;i<=NF;i++) sum+=$i }END{printf("%d%%\n", sum)}')
echo "	#Disk Usage: $dused/${dtotal}Gb ($dup)"
top -bn1 | grep '^%Cpu' | cut -c 9- | xargs | awk '{printf("	#CPU load: %.1f%%\n"), $1 + $2 + $3}'
echo "	#Last boot: $(uptime -s)"
lvms=$(lsblk | grep lvm | wc -l)
if [ $lvms -gt 0 ]; then echo "	#LVM use: yes"; else echo "	#LVM use: no"; fi
echo "	#Connections TCP : $(ss -t | grep ESTAB | wc -l) ESTABLISHED"
echo "	#User log: $(who | awk '{print $1}' | uniq | wc -l)"
echo "	#Network: IP $(hostname -I) ($(ip a | grep link/ether | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}' | head -n 1))"
echo "	#Sudo : $(cat /var/log/sudo/sudo.log | grep COMMAND | wc -l) cmd"
