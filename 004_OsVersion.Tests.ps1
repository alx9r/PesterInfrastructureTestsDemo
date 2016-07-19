$computernames = 'localhost','127.0.0.1'

foreach ( $computername in $computernames )
{
    Describe "Operating System Version on $computername" {
        It 'is Windows 8.1 or Server 2012R2' {
            # Don't overspecify your tests.
            $r = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $computername |
                % Version
            $r.Split('.')[0] | Should be 6
            $r.Split('.')[1] | Should be 3
        }
    }
}