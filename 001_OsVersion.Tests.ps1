# The basic test.
Describe 'Operating System Version' {
    It 'is Windows 8.1' {
        Get-WmiObject Win32_OperatingSystem | 
            % Version |
            Should be '6.3.9600'
    }
}