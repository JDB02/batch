@echo off
type IR.txt
@echo Incident Response BAT file
@echo Press CTRL-C to terminate


(
	echo COMPUTERNAME *****************************************************************************************
	@ echo %ComputerName%
	echo:
	echo:
	echo wmic os get localdatetime **********************************************************************************
	wmic os get localdatetime
	echo:
	echo:
	echo whoami *******************************************************************************************************
	whoami
	echo:
	echo:
	echo quser *********************************************************************************************************
	quser
	echo:
	echo:
	echo hostname ****************************************************************************************************
	hostname 
	echo:
	echo:
	echo net user ******************************************************************************************************
	net user
	echo:
	echo:
	echo net localgroup administrators ******************************************************************************
	net localgroup administrators
	echo:
	echo:
	echo ping 8.8.8.8. *************************************************************************************************
	ping 8.8.8.8
	echo:
	echo:
	echo systeminfo ***************************************************************************************************
	systeminfo
	echo:
	echo:
	echo nbtstat /n *****************************************************************************************************
	nbtstat /n 
	echo:
	echo:
	echo nbtstat /r ******************************************************************************************************
	nbtstat /r 
	echo:
	echo:
	echo net statistics workstation ***********************************************************************************
	net statistics workstation
	echo:
	echo:
	echo net view \\127.0.0.1 *****************************************************************************************
	net view \\127.0.0.1
	echo:
	echo:
	echo ipconfig -all ***************************************************************************************************
	ipconfig -all
	echo:
	echo:
	echo ipconfig /displaydns *****************************************************************************************
	ipconfig /displaydns 
	echo:
	echo:
	echo arp -a *********************************************************************************************************
	arp -a 
	echo:
	echo:
	echo netstat -nao ***************************************************************************************************
	netstat -nao
	echo:
	echo:
	echo net start *******************************************************************************************************
	net start
	echo:
	echo:
	echo tasklist *********************************************************************************************************
	tasklist
	echo:
	echo:
	echo tasklist -v ******************************************************************************************************
	tasklist -v 
	echo:
	echo:
	echo tasklist -svc ***************************************************************************************************
	tasklist -svc
	echo:
	echo:
	echo net session ***************************************************************************************************
	net session
	echo:
	echo:
	echo net use ********************************************************************************************************
	net use
	echo:
	echo:
	echo dir C:\ **********************************************************************************************************
	dir C:\
	echo:
	echo:
	echo dir /S C:\users ************************************************************************************************
	dir /S C:\users
	echo:
	echo:
	echo dir /S C:\"Program Files" *************************************************************************************
	dir /S C:\"Program Files"
	echo:
	echo:
	echo dir /S C:\"Program Files (x86)" ******************************************************************************
	dir /S C:\"Program Files (x86)"
	echo:
	echo:
	echo dir sc query ****************************************************************************************************
	sc query 
	echo:
	echo:
	echo dir tree /A ******************************************************************************************************
	tree /A
	echo:
	echo:
	echo wmic process get name, parentprocessid, processid ******************************************************
	wmic process get name, parentprocessid, processid
	echo:
	echo:
	echo wmic process list full ******************************************************************************************
	wmic process list full
	
) > "%COMPUTERNAME% %DATE:~4,2%%DATE:~7,2%%DATE:~-4% %time::=%".csv

exit
