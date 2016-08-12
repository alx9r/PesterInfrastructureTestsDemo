Import-Module Pester
Set-Location "$env:USERPROFILE\Desktop\PesterInfrastructureTestsDemo"
explorer .
ise .\000_Intro.ps1
Clear-Host

Describe 'screen resolution' {
    It 'should be 1280x800' {
        $r = Get-WmiObject Win32_DesktopMonitor
        $r.ScreenHeight | Should be 800
        $r.ScreenWidth | Should be 1280
    }
}