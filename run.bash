
echo "PROCESS WITH HIGEST MEMEORY"
echo '==========================='
ps aux| sort -rk 4,4 | head -n 6| awk '{print $2, $4, $11}'


echo "PROCESS WITH HIGHEST CPU"
echo '==========================='

ps aux| sort -rk 3,3 | head -n 6| awk '{print $2, $3, $11}'

echo "HIGHEST DISK USAGE"
echo '==========================='

df -Th | sort -rk 6| head -n 5

echo "CURRENT IOSTAT"
echo '==========================='

iostat

echo "VMSTATS"
echo '==========================='

vmstat | awk ' END {print "No process waiting for CPU:" $1, "\nMemory Idle:" $4, "\n\nSwapped In memory:" $9, "\nSwapped Out Memory:" $10, "\n\nCPU time runnning user code:" $15, "\nCPU time runnning system code:" $16, "\n\nInterupts per sec:" $13, "\nContext switches per sec:" $14} '


echo "System INFO"
echo '==========================='

echo "No of cores":  `nproc`
echo "Uptime"

w

echo "Max thread Running process[3rd column is number of threads]"
echo '==========================='
ps axo pid,ppid,nlwp,cmd | sort -nr| head -n 5