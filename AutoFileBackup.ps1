#Enable temporary Script Execution
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
#Define Variable to save space and time
$Date = (Get-Date)
$DateOld = ((Get-Date).AddDays(-14))
$DestinationPathforCB = "\\NAS\Household Files\Bookkeeping Files\Checkbook Register*.*"
$DestinationPathforBills = "\\NAS\Household Files\Bookkeeping Files\Bills*.*"
$DestinationFilePath = "\\NAS\Household Files\Bookkeeping Files"
#Wake up the NAS
Get-ChildItem $DestinationFilePath
Start-Sleep -Seconds 5
$newestCB = (Get-ChildItem $DestinationPathforCB | Sort-Object -Descending LastWriteTime)
$newestBills = (Get-ChildItem $DestinationPathforBills | Sort-Object -Descending LastWriteTime)
#determine if a backup from the last two weeks already exists, if it does not copy the file to the destination path and name it with the date
if ($newestCB[0].LastWriteTime -lt $DateOld) 
{
    Copy-Item -Path "$env:USERPROFILE\Desktop\Checkbook Register.xlsx" -Destination ($DestinationFilePath + "\Checkbook Register as of " + $Date.tostring("ddMMMyy") + ".xlsx")
}
if ($newestBills[0].LastWriteTime -lt $DateOld) 
{
    Copy-Item -Path "$env:USERPROFILE\Desktop\Bills.xlsx" -Destination ($DestinationFilePath + "\Bills as of " + $Date.tostring("ddMMMyy") + ".xlsx")
}
