get-rdusersession
$usersonline=get-rdusersession
write-host -ForegroundColor yellow "_________________________"
write-host "Users online =" $usersonline.count
