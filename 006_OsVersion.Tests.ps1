# Separate the collection of objects from the interrogation
# of objects.  That way you can write tests against the saved
# records without repeatedly querying your servers.

$computernames = '127.0.0.1','localhost'
$records = @{}

foreach ( $computername in $computernames )
{
    $record = @{}
    $records.$computername = $record
    Describe "Computer $computername" {
        It 'get Win32_OperatingSystem WMI Object' {
            $splat = @{
                ComputerName = $computername
                Class = 'Win32_OperatingSystem'
            }
            $record.Win32_OperatingSystem = Get-WmiObject @splat
            $record.Win32_OperatingSystem |
                Should not beNullOrEmpty
        }
    }
}
# This foreach can be executed against saved records.
foreach ( $computername in $records.Keys )
{
    $record = $records.$computername
    Describe "Computer $computername" {
        It 'extract the VersionString' {
            $record.OSVersion = $record.Win32_OperatingSystem | % Version
            $record.OSVersion | Should not beNullOrEmpty
            $record.OSVersion | Should beOfType 'string'
        }
        It "version matches pattern" {
            $record.OSVersion | Should match '6\.1'
        }
    }
}


# To save $records:
# $records | Export-Clixml "$env:USERPROFILE\desktop\OsVersionRecords.xml"

# To open saved $records:
# $records = Import-Clixml "$env:USERPROFILE\desktop\OsVersionRecords.xml"