
RED='\033[0;32m'

printf "\n______________________________________________________________\n\n$(tput sgr0)"
printf ${RED}$(tput bold)"Starting Computer System Overview Screen"
printf "\n______________________________________________________________\n\n$(tput sgr0)"

print_message(){	
	printf "\n\n"
	printf ${RED}$(tput bold)"$1"
	printf "\n\n$(tput sgr0)"
}




print_message "CURRENT IOSTAT" 1 60

iostat

print_message "VMSTATS"

vmstat | awk ' END {print "No_process_waiting_for_CPU: " $1, "\nMemory_Idle: " $4, "\n\nSwapped_In_memory: " $9, "\nSwapped_Out_Memory: " $10, "\n\nCPU_time_runnning_user_code: " $15, "\nCPU_time_runnning_system_code: " $16, "\n\nInterupts_per_sec: " $13, "\nContext_switches_per_sec: " $14} '| column -t


print_message "Simple INFO"

echo "No of cores":  `nproc`
echo "Uptime"

w

print_message "Max thread Running process[3rd column is number of threads]"
ps axo pid,ppid,nlwp,cmd | sort -nr| head -n 5

print_message "PROCESS WITH HIGEST MEMEORY"  30 70
ps aux| sort -rk 4,4 | head -n 5| awk '{print $2, $4, $11}'| column -t

print_message "PROCESS WITH HIGHEST CPU" 

ps aux| sort -rk 3,3 | head -n 5| awk '{print $2, $3, $11}'| column -t


print_message "HIGHEST DISK USAGE" 1 10

df -Th | sort -rk 6| head -n 3| column -t