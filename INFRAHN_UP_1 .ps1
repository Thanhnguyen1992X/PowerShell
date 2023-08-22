Function Send-Telegram {
Param([Parameter(Mandatory=$true)][String]$Message)
$Telegramtoken = ""
$Telegramchatid = ""
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$Response = Invoke-RestMethod -Uri "https://api.telegram.org/bot$($Telegramtoken)/sendMessage?chat_id=$($Telegramchatid)&text=$($Message)"}

Send-Telegram -Message "The succeeded ping: $args"

$Username = "";
$Password = "";
$SendTo = "";
$MailServer = "smtp.gmail.com";$HostName = $args[0];
$IPAddress = $args[1];$PingStatus = $args[2];
$SucceedOn = $args[3];
$message = new-object Net.Mail.MailMessage;$message.From = $Username;
$message.To.Add($SendTo);$message.Subject = "Succeed Ping On $HostName" ;
$message.Body = "Information about the Succeeded ping: `r`nHost Name: $HostName`r`nIP Address: $IPAddress`r`nPing Status: $PingStatus`r`nPing Time: $SucceedOn";
$smtp = new-object Net.Mail.SmtpClient($MailServer, "587");$smtp.EnableSSL = $true;
$smtp.Credentials = New-Object System.Net.NetworkCredential($Username, $Password);$smtp.send($message);