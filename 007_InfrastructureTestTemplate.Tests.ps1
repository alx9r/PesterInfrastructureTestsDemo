$computernames = '127.0.0.1','localhost'

$records = @{}
foreach ( $computername in $computernames )
{
    $record = @{}
    $records.$computername = $record
    Describe "Computer $computername" {
        It 'get some object' {
            # $record.ObjectName = Get-SomeObject
        }
    }
}
foreach ( $computername in $records.Keys )
{
    $record = $records.$computername
    Describe "Computer $computername" {
        It 'interrogate the object' {
            # $record.ObjectName | Should be something
        }
    }
}

# To save $records:
# $records | Export-Clixml "$env:USERPROFILE\desktop\OsVersionRecords.xml"

# To open saved $records:
# $records = Import-Clixml "$env:USERPROFILE\desktop\OsVersionRecords.xml"