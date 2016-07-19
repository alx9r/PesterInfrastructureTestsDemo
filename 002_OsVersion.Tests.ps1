Describe 'Operating System Version' {
    It 'is Windows 8.1 or Server 2012R2' {
        $r = Get-WmiObject Win32_OperatingSystem |
            % Version
        $r | Should match '^6\.3\.'
    }
}