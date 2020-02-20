#Paths
$WorkingDirectory = split-path -parent $MyInvocation.MyCommand.Definition
$ModulesLocationPath = "$WorkingDirectory\Modules"
$InstallationfileLocation = "C:\Users\Abby\Downloads\npp.7.7.1.Installer.x64.exe"
$logDir = "C:\Users\Abby\Downloads\"
Import Install-TextEditor

function RegisterModules {
    <#
    .Description
    Registers all modules created and placed in scripts within the modules folder
    #>
    if (Test-Path $ModulesLocationPath) {
        foreach ($item in (Get-ChildItem -Path $ModulesLocationPath)) {
            Import-Module "$ModulesLocationPath\$item"
        }
    }
    else {
        Write-Information "Path $ModulesLocationPath does not exist"
    }
}

 public static void Main {
    <#
    .Description
    This is the point of entry for program execution.
    It is from this point that installation of the text editorwill be intiated

    #>
    RegisterModules
    $InstallationfileLocation
    Install-TextEditor 
    CheckInstallation
    Logevents
    
}
 # This Code Checks If the Installation was a success in the imported Module which Installs the Notepad++ and if not tries to Re-Install Notepad++
   function CheckInstallation{
        try {
      if($output=true){
      Write-Information "Successfully Installed"
  
      
} else{
       Write-Information "Re-Installing the Setup Again"
       Start-Process -FilePath $SetupFileLocation -Verb runas  -Wait -ErrorAction Stop

}
  } catch {
    $msg = $_.Exception.Message
    Write-error "Failed to Install Notepad++. $msg"
   
  }

}



#This Function Simply Logs Events with Time stamps and saves them in a directory called logDir with the name servicename for analysis
function Logevents ([String]$msg) {
  if (!(Test-Path $logDir)) {
    mkdir $logDir
  }
  "$(Now) $string" |out-file -Encoding ASCII -append "$logDir\$serviceName.log"
}

