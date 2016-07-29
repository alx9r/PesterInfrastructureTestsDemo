Describe 'Operating System Version' {
    It 'is Windows 8.1' {
        # Assign the subject of your test to a variable...
        $r = Get-WmiObject Win32_OperatingSystem
        # ...that way you can set a breakpoint to debug it.
        $r | Should be '6.3.9600'
    }
}