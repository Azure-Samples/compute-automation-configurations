#!/bin/bash

# The MIT License (MIT)
#
# Copyright (c) 2015 Microsoft Azure
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Install IIS
Add-WindowsFeature Web-Server

# Create directory and default page for Contoso
New-Item -Path "C:\inetpub\wwwroot\contoso" -Type "Directory"
Set-Content -Path "C:\inetpub\wwwroot\contoso\Default.htm" -Value "Contoso website on host $($env:computername) !"

# Create IIS app pool and web site for Contoso
New-WebAppPool -Name "ContosoAppPool"
New-WebSite -Name "Contoso Web Site" -IPAddress "*" -Port 80 -HostHeader "contoso" -PhysicalPath "C:\inetpub\contoso" -ApplicationPool "ContosoAppPool"

# Create directory and default page for Fabrikam
New-Item -Path "C:\inetpub\wwwroot\fabrikam" -Type "Directory"
Set-Content -Path "C:\inetpub\wwwroot\fabrikam\Default.htm" -Value "Fabrikam website on host $($env:computername) !"

# Create IIS app pool and web site for Contoso
New-WebAppPool -Name "FabrikamAppPool"
New-WebSite -Name "Fabrikam Web Site" -IPAddress "*" -Port 80 -HostHeader "fabrikam" -PhysicalPath "C:\inetpub\fabrikam" -ApplicationPool "FabrikamAppPool"
