# apply the same test to multiple computers
$computernames = 'localhost','127.0.0.2'

# This has problems:
#  1. How do you efficiently look at the WMI object from a particular computer?
#  2. Errors retrieving the WMI object are incorrectly reported as incorrect
#     OS Versions.
foreach ( $computername in $computernames )
{
    Describe "Operating System Version on $computername" {
        It 'is Windows 8.1 or Server 2012R2' {
            $r = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $computername |
                % Version
            $r.Split('.')[0] | Should be 6
            $r.Split('.')[1] | Should be 3
        }
    }
}