Describe 'Operating System Version' {
    It 'is Windows 8.1 or Server 2012R2' {
        Get-WmiObject Win32_OperatingSystem |
            % Version |
            Should be '6.3.9600'
    }
}