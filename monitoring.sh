echo "#Architecture: $(uname -a)"
echo "#CPU physical : $(grep "processor" /proc/cpuinfo | wc -l)"
