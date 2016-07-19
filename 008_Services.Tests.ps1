$computernames = '127.0.0.1','localhost'

$records = @{}
foreach ( $computername in $computernames )
{
    $record = @{}
    $records.$computername = $record
    Describe "Computer $computername" {
        It 'Get-Service cmdlet' {
            $record.ServicesCmdlet = Get-Service -ComputerName $computername
            $record.ServicesCmdlet |
                Should not beNullOrEmpty
        }
        It 'win32_Service WMI Class' {
            $splat = @{
                Class = 'Win32_Service'
                ComputerName = $computername
            }
            $record.ServicesWmi = Get-WmiObject @splat
            $record.ServicesWmi |
                Should not beNullOrEmpty

        }
    }
}

foreach ( $computername in $records.Keys )
{
    $record = $records.$computername
    Describe "Computer $computername" {
        Context 'ServicesCmdlet' {
            It 'extract BITS' {
                $record.BitsServiceCmdlet = $record.ServicesCmdlet |
                    ? { $_.Name -eq 'BITS' }
            }
            It 'there is exactly one BITS service' {
                $record.BitsServiceCmdlet |
                    Measure |
                    % Count |
                    Should be 1
            }
            It 'BITS is running' {
                $record.BitsServiceCmdletStatus = $record.BitsServiceCmdlet.Status
                $record.BitsServiceCmdletStatus |
                    Should be running
            }
        }
        Context 'Services WMI Objects' {
            It 'extract BITS' {
                $record.BitsServiceWmi = $record.ServicesWmi |
                    ? { $_.Name -eq 'BITS' }
            }
            It 'there is exactly one BITS service' {
                $record.BitsServiceWmi |
                    Measure |
                    % Count |
                    Should be 1
            }
            It 'BITS is set to start automatically.' {
                $record.BitsServiceWmiStartMode = $record.BitsServiceWmi.StartMode
                $record.BitsServiceWmiStartMode |
                    Should be Auto
            }
        }
    }
}

# To save $records:
# $records | Export-Clixml "$env:USERPROFILE\desktop\OsVersionRecords.xml"

# To open saved $records:
# $records = Import-Clixml "$env:USERPROFILE\desktop\OsVersionRecords.xml"