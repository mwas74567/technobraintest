#Paths
$WorkingDirectory = split-path -parent $MyInvocation.MyCommand.Definition
$ModulesLocationPath = "$WorkingDirectory\Modules"
$InstallationfileLocation = "C:\Users\Abby\Downloads\npp.7.7.1.Installer.x64.exe"

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
  function Event{
      foreach($false > 0){
         Write-Information "Failed.. Re-running the installation."
       Install-TextEditor
         }
        try{

        Set-ExecutionPolicy RemoteSigned
           }
 
        catch{
         Get-EventLog -List
          }
     
          
           }
             }

function Main {
    <#
    .Description
    This is the point of entry for program execution.
    It is from this point that installation of the text editorwill be intiated

    #>
    RegisterModules
    Install-TextEditor 
    Event
    $InstallationfileLocation
}
