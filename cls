if [ "${HOME}" != "/root" ] ; then 
	clear
	exit 0
else
	cd /opt/sh/
	sh clean.sh && sh cpu-unlock.sh
	sleep 1 && clear	
fi
