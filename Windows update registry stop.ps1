function disable-winUpdateReg {
    param (
        
    )
    Clear-host
    $winPath = "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows"
    if(Test-Path -path $winPath\WindowsUpdate){
        "Key already exist!"
        # New-Item -path $winPath -Name "WindowsUpdate"
        #New-Item -path $winPath\WindowsUpdate -Name "AU"
        #New-ItemProperty -path $winPath\WindowsUpdate\AU -Name NoAutoUpdate -PropertyType DWord -Value 1
        return Get-ItemPropertyValue -path $winPath\WindowsUpdate\AU -Name NoAutoUpdate
    }
    else {
        New-Item -path $winPath -Name "WindowsUpdate"
        New-Item -path $winPath\WindowsUpdate -Name "AU"
        New-ItemProperty -path $winPath\WindowsUpdate\AU -Name NoAutoUpdate -PropertyType DWord -Value 1
        return Get-ItemPropertyValue -path $winPath\WindowsUpdate\AU -Name NoAutoUpdate
    }
}
 disable-winUpdateReg
