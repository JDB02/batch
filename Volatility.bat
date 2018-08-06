@echo Volatility Batch to analyze RAW memory files
@echo off

SET initDir=D:\VolatilityDump
SET newDir=
SET /P newDir=Type folder name: %=%

IF DEFINED newDir 
(
	mkdir D:\VolatilityDump\%newDir%
	SET initDir=%initDir%\%newDir%
)

SET /P memfile=memory file name with extension:


volatility.exe -f %memfile% imageinfo > %initDir%\imageinfo.txt
type %initDir%\imageinfo.txt

SET /P volprof=Enter profile from above output exactly as displayed:

volatility.exe -f %memfile% --profile=%volprof% cmdscan > %initDir%\cmdscan.txt
volatility.exe -f %memfile% --profile=%volprof% consoles > %initDir%\consoles.txt
volatility.exe -f %memfile% --profile=%volprof% pstree > %initDir%\pstree.txt
volatility.exe -f %memfile% --profile=%volprof% dlllist > %initDir%\dlllist.txt
volatility.exe -f %memfile% --profile=%volprof% cmdline > %initDir%\cmdline.txt
volatility.exe -f %memfile% --profile=%volprof% envars > %initDir%\envars.txt
mkdir %initDir%\procdump
volatility.exe -f %memfile% --profile=%volprof% procdump -D %initDir%\procdump > %initDir%\procdump\output.txt
volatility.exe -f %memfile% --profile=%volprof% getsids > %initDir%\getsids.txt
mkdir %initDir%\malfind
volatility.exe -f %memfile% --profile=%volprof% malfind -D %initDir%\malfind > %initDir%\malfind\output.txt
volatility.exe -f %memfile% --profile=%volprof% iehistory > %initDir%\iehistory.txt
volatility.exe -f %memfile% --profile=%volprof% svcscan -v > %initDir%\svcscan.txt
volatility.exe -f %memfile% --profile=%volprof% netscan > %initDir%\netscan.txt
volatility.exe -f %memfile% --profile=%volprof% conscan > %initDir%\conscan.txt
volatility.exe -f %memfile% --profile=%volprof% filescan > %initDir%\filescan.txt
volatility.exe -f %memfile% --profile=%volprof% hivelist > %initDir%\hivelist.txt
volatility.exe -f %memfile% --profile=%volprof% shellbags > %initDir%\shellbags.txt
mkdir %initDir%\mftparser
volatility.exe -f %memfile% --profile=%volprof% mftparser -D %initDir%\mftparser > %initDir%\mftparser\output.txt
volatility.exe -f %memfile% --profile=%volprof% sessions > %initDir%\sessions.txt
volatility.exe -f %memfile% --profile=%volprof% wndscan > %initDir%\wndscan.txt
volatility.exe -f %memfile% --profile=%volprof% clipboard > %initDir%\clipboard.txt
volatility.exe -f %memfile% --profile=%volprof% messagehooks > %initDir%\messagehooks.txt
volatility.exe -f %memfile% --profile=%volprof% windows > %initDir%\windows.txt
volatility.exe -f %memfile% --profile=%volprof% wintree > %initDir%\wintree.txt
mkdir %initDir%\screenshot
volatility.exe -f %memfile% --profile=%volprof% screenshot -D %initDir%\screenshot > %initDir%\screenshot\output.txt
volatility.exe -f %memfile% --profile=%volprof% lsadump > %initDir%\lsadump.txt
volatility.exe -f %memfile% --profile=%volprof% cachedump > %initDir%\cachedump.txt
volatility.exe -f %memfile% --profile=%volprof% hashdump > %initDir%\hashdump.txt
volatility.exe -f %memfile% --profile=%volprof% yarascan -Y "/(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)/" > %initDir%\ipv4.yarascan.txt

volatility.exe -f %memfile% --profile=%volprof% printkey -K "Microsoft\Windows NT\CurrentVersion\ProfileList" > %initDir%\printkey.ProfileList.txt
volatility.exe -f %memfile% --profile=%volprof% printkey -K "Microsoft\Windows NT\CurrentVersion" > %initDir%\printkey.details.txt

volatility.exe -f %memfile% --profile=%volprof% printkey -K "Microsoft\Windows\CurrentVersion\Run" > %initDir%\printkey.system.Run.txt
volatility.exe -f %memfile% --profile=%volprof% printkey -K "Microsoft\Windows\CurrentVersion\RunOnce" > %initDir%\printkey.system.RunOnce.txt

volatility.exe -f %memfile% --profile=%volprof% printkey -K "Software\Microsoft\Windows\CurrentVersion\Run" > %initDir%\printkey.Users.Run.txt
volatility.exe -f %memfile% --profile=%volprof% printkey -K "Software\Microsoft\Windows\CurrentVersion\RunOnce" > %initDir%\printkey.Users.RunOnce.txt

volatility.exe -f %memfile% --profile=%volprof% printkey -K "Select" > printkey.controlsetSelect.txt
volatility.exe -f %memfile% --profile=%volprof% printkey -K "ControlSet001\Control\TimeZoneInformation > printkey.TimeZoneInformation.Set1.txt
volatility.exe -f %memfile% --profile=%volprof% printkey -K "ControlSet001\Control\ComputerName > printkey.ComputerName.Set1.txt
volatility.exe -f %memfile% --profile=%volprof% printkey -K "ControlSet002\Control\TimeZoneInformation > printkey.TimeZoneInformation.Set2.txt
volatility.exe -f %memfile% --profile=%volprof% printkey -K "ControlSet002\Control\ComputerName > printkey.ComputerName.Set2.txt

:END


