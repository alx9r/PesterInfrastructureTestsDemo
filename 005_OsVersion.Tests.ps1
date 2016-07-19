# Record the object for each computer.

$computernames = '127.0.0.2','localhost'

# Create a variable to record the objects you are interrogating.
$records = @{}
foreach ( $computername in $computernames )
{
    # Create a new "record" for each computername
    $record = @{}
    $records.$computername = $record

    Describe "Computer $computername" {
        # If retrieval fails, this test will fail.
        # This is a prerequisite to the other test, so it goes first.
        It 'get Win32_OperatingSystem WMI Object' {
            $splat = @{
                ComputerName = $computername
                Class = 'Win32_OperatingSystem'
            }
            # record the object in its raw form
            $record.Win32_OperatingSystem = Get-WmiObject @splat
            $record.Win32_OperatingSystem |
                Should not beNullOrEmpty
        }
        It 'extract the VersionString' {
            $record.OSVersion = $record.Win32_OperatingSystem | % Version
            $record.OSVersion | Should not beNullOrEmpty
            $record.OSVersion | Should beOfType 'string'
        }
        # If OS Version is wrong, this test will fail.
        # This depends on retrieving the WMI object, so it goes after
        # that step.
        It "version matches pattern" {
            $record.OSVersion | Should match '6\.1'
        }
    }
}