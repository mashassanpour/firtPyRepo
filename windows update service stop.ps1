################################################################################## 

# Description: This script has created to stop windows update service simply and  

# properly.  

# Author: Masoud Haji Hassan Pour 

# Contact details: mas.hassanpour@gmail.com  

# Version : 1.0.0 

################################################################################## 

function stop-windowsUpdate { 

    param ( 

         

    ) 

    $service = Get-Service -DisplayName "Windows update" | Select-Object Name 

    if((Get-Service -DisplayName "Windows update").StartType -ne "Disabled"){ 

        Set-Service -Name $service.Name -StartupType Disabled -Confirm:$false 

    } 

    if((Get-Service -DisplayName "Windows update") -ne "Stopped"){ 

        Stop-Service -Name $service.Name -Confirm:$false 

    } 

    return Get-Service -DisplayName "Windows update" | Select-Object Name, DisplayName, Status, StartType 

} 

 
 

function disable_windowsUpdate { 

    param ( 

         

    ) 

    return Get-Service -DisplayName "Windows update" | Select-Object StartType 

} 

Clear-Host 

stop-windowsUpdate 
