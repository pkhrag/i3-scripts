#! /bin/bash
while [ 1 -lt 3 ]; do
	# ping -q -w 1 -c 1 `ip r | grep default | cut -d ' ' -f 3` > /dev/null && echo ok || (sudo network-config -ta "room ironport lan"; wget --no-check-certificate --http-user=shresth --http-password=rockin19 www.msn.com)
	if [[ "$(ping -c 1 8.8.8.8 | grep '0% packet loss' )" != "1 packets transmitted, 1 received, 0% packet loss, time 0ms" ]]; then
	    echo "Internet isn't present"
	    curr_ip=$(ip route get 8.8.8.8 | awk '{print $NF; exit}')
	    my_ip="172.20.180.41"
	    if [ $curr_ip = $my_ip ]; then
	    	echo "IP is correct"
	    	wget --no-check-certificate --http-user=<IITK_USERNAME> --http-password=<PASSWORD> msn.com &
	    else
	    	sudo network-config -ta "room ironport lan"
	    fi
    	# exit 1
	else
    	echo "Internet is present"
    # wget www.site.com
	fi
	rm index.html*
	sleep 1
done