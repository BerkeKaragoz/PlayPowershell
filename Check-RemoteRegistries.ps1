#You're gonna need this!
#http://www.quest.com/powershell/activeroles-server.aspx
foreach ($MachineList in Get-QADComputer | select -first 10  )
{
$MachineName = $MachineList.Name
$MachineName
$reg = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey('LocalMachine', $MachineName)

$regKey= $reg.OpenSubKey("SOFTWARE\\Microsoft\\Microsoft SQL Server\\Instance Names\\SQL" )
$MachineName
$regKey.GetValueNames()
}