$ipaddress = Read-Host “Enter the IP Address”
$submask = Read-Host “Enter Subnet Mask”
$GW = Read-Host “Enter Default Gateway”

$NICs = Get-WMIObject Win32_NetworkAdapterConfiguration | where {$_.MACAddress -eq "00:24:E8:B0:7D:E2"}
Foreach($NIC in $NICs) {
$NIC.EnableStatic("$ipaddress","$submask")
$NIC.SetGateways("$GW")
$DNSServers = "10.5.5.30","10.5.6.30"
$NIC.SetDNSServerSearchOrder($DNSServers)
$NIC.SetDynamicDNSRegistration("TRUE")
}