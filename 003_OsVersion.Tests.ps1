Describe 'Operating System Version' {
    It 'is Windows 8.1 or Server 2012R2' {
        # Don't overspecify your tests.
        $r = Get-WmiObject Win32_OperatingSystem |
            % Version
        $r.Split('.')[0] | Should be 6
        $r.Split('.')[1] | Should be 3
    }
}