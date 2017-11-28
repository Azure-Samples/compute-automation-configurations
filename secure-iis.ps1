New-WebBinding -Name "Default Web Site" -Protocol https -Port 443
Get-ChildItem cert:\localmachine\My | New-Item -Path IIS:\SslBindings\!443