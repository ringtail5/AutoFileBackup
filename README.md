# AutoFileBackup
PowerShell script to automatically back up files if they last backup is older than 14 days.

This script, when added to a logoff group policy, will allow files to be sent to a backup location automatically if the previous backup files are older than two weeks since the last update.

The file names can be changed to reflect the intended files and the date can be changed to allow for lesser or greater frequency.  

I used the script in logoff because it ensured any changes made during that users session were backedup if nessisary and to ensure network connectivity existed.  
When used in a logon script the script failed due to the logon happening prior to network connectivity.  I did not want to change the logon to wait for the network because it would create to great of a slowdown to the logon process.

The reason the script asks the NAS for its directory info is to wake it up prior to execution.
