# Chrome
md -Path $env:temp\chromeinstall -erroraction SilentlyContinue | Out-Null
$Download = join-path $env:temp\chromeinstall chrome_installer.exe
Invoke-WebRequest 'http://dl.google.com/chrome/install/375.126/chrome_installer.exe'  -OutFile $Download
Invoke-Expression "$Download /silent /install"

# Winrar
md -Path $env:temp\winrarinstall -ErrorAction SilentlyContinue | Out-Null
$Download = Join-Path $env:temp\winrarinstall winrar_installer.exe
Invoke-WebRequest 'https://www.rarlab.com/rar/winrar-x64-624es.exe' -OutFile $Download
Start-Process -FilePath $Download -ArgumentList "/S" -Wait

# Adobe reader
md -Path $env:temp\adobereaderinstall -ErrorAction SilentlyContinue | Out-Null
$Download = Join-Path $env:temp\adobereaderinstall AcroRdrDC.exe
Invoke-WebRequest 'ftp://ftp.adobe.com/pub/adobe/reader/win/AcrobatDC/2001320064/AcroRdrDC2001320064_en_US.exe' -OutFile $Download
Start-Process -FilePath $Download -ArgumentList "/sAll /rs /l /msi EULA_ACCEPT=YES" -Wait

#Java
md -Path $env:temp\javainstall -ErrorAction SilentlyContinue | Out-Null
$Download = Join-Path $env:temp\javainstall jre_installer.exe
Invoke-WebRequest 'https://javadl.oracle.com/webapps/download/AutoDL?BundleId=249553_4d245f941845490c91360409ecffb3b4' -OutFile $Download
Start-Process -FilePath $Download -ArgumentList "/s" -Wait

# Team Viewer
md -Path $env:temp\teamviewerinstall -ErrorAction SilentlyContinue | Out-Null
$Download = Join-Path $env:temp\teamviewerinstall teamviewer_installer.exe
Invoke-WebRequest 'https://download.teamviewer.com/download/TeamViewer_Setup_x64.exe?utm_source=bing&utm_medium=cpc&utm_campaign=mx%7Cb%7Cpr%7C23%7Cmar%7Ctv-core-brand-only-sn%7Cnew%7Ct0%7C0&utm_content=Phrase&utm_term=teamviewer' -OutFile $Download
Start-Process -FilePath $Download -ArgumentList "/S" -Wait

# AnyDesk
$AnyDeskInstallerPath = Join-Path $env:temp "AnyDeskInstaller.exe"
Invoke-WebRequest 'https://download.anydesk.com/AnyDesk.exe' -OutFile $AnyDeskInstallerPath
Start-Process -FilePath $AnyDeskInstallerPath -ArgumentList "/S" -Wait

#Crear Usuario y convertiro en administrador
$SecurePassword = ConvertTo-SecureString "usuario" -AsPlainText -Force
New-LocalUser -Name 'Usuario' -Description 'Usuario final de la computadora' -Password $SecurePassword
Add-LocalGroupMember -Group "Administradores" -Member "Usuario"

$SecurePassword = ConvertTo-SecureString "plasa66" -AsPlainText -Force
Set-LocalUser -Name 'bescoto' -Password $SecurePassword


# Desinstalar apps inutiles
Get-AppxPackage -AllUsers | Remove-AppxPackage